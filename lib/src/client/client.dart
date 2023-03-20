import 'package:dio/dio.dart';
import 'package:real_time_track_package/real_time_track_package.dart';

export 'exceptions.dart';
export 'header_builder.dart';
export 'result.dart';

export 'package:dio/dio.dart'
    show
        Response,
        Interceptor,
        Interceptors,
        LogInterceptor,
        MultipartFile,
        DioError;

enum MethodType { post, get, delete, put, patch }

typedef UnauthenticatedErrorCallback = void Function();

class RttClient {
  late Dio _dio;
  String? _baseUrl;
  UnauthenticatedErrorCallback? _unauthenticatedErrorCallback;

  static set baseUrl(String value) {
    if (value == instance._baseUrl) return;
    instance._baseUrl = value;
  }

  static set unauthenticatedError(UnauthenticatedErrorCallback value) {
    if (value == instance._unauthenticatedErrorCallback) return;
    instance._unauthenticatedErrorCallback = value;
  }

  static RttClient get instance => RttClient._();

  RttClient._() {
    instance._dio = Dio(BaseOptions(baseUrl: instance._baseUrl ?? ''))
      ..interceptors.addAll(
        [
          _LogInterceptor(),
          _AuthorizationInterceptor(instance._unauthenticatedErrorCallback)
        ],
      );
  }

  Future<dynamic> request({
    required String path,
    required MethodType method,
    dynamic data,
  }) async {
    try {
      if (await ConnectivityService.isConnected) {
        Response response = await _dio.request(
          path,
          data: data,
          options: Options(method: method.name.toUpperCase()),
        );

        if (response.data['resultCode'] == '1') {
          return response.data;
        } else {
          throw RttException(
            response.data['resultDescription'],
            data: response.data,
          );
        }
      } else {
        throw const RttException(kNoInternetConnection);
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectionTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        throw RttException(e.message ?? kDefaulErrorMessage);
      } else {
        throw RttException(
          e.message ?? kDefaulErrorMessage,
          data: e.response?.data,
        );
      }
    } catch (e) {
      throw RttException(e.toString());
    }
  }
}

class _LogInterceptor extends LogInterceptor {
  _LogInterceptor()
      : super(
          request: false,
          requestBody: true,
          responseHeader: false,
          responseBody: true,
        );
}

class _AuthorizationInterceptor extends Interceptor {
  final RttClient client;
  final UnauthenticatedErrorCallback? onUnauthenticatedError;

  _AuthorizationInterceptor(this.onUnauthenticatedError)
      : client = RttClient.instance;

  final Preferences _preferences = Preferences.instance;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    super.onRequest(options, handler);
    options.responseType = ResponseType.json;

    if (_preferences.isLogged) {
      Tokens tokens = _preferences.tokens;
      if (tokens.accessToken != null) {
        String accessToken = tokens.accessToken ?? '';
        if (tokens.jwt.isExpired) {
          dynamic response = await client.request(
            path: '/account/token/refresh/',
            method: MethodType.post,
            data: {'refresh': tokens.refreshToken},
          );
          if (response['resultCode'] == '1') {
            accessToken = response['access'];
            _preferences.tokens = tokens.replaceAccessToken(accessToken);
          }
        }
        options.headers = HeaderBuilder.builder()
            .setContentType('application/json')
            .setBearerToken(accessToken)
            .build();
      }
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    super.onResponse(response, handler);

    BaseResponse baseResponse = BaseResponse.fromResponse(response.data);

    switch (baseResponse.code) {
      case ResultStatusCode.tokenExpired:
        Tokens tokens = _preferences.tokens;

        dynamic response = await client.request(
          path: '/account/token/refresh',
          method: MethodType.post,
          data: {'refresh': tokens.refreshToken},
        );
        if (response['resultCode'] == '1') {
          _preferences.tokens = tokens.replaceAccessToken(response['access']);
        }
        handler.next(response);
        break;
      case ResultStatusCode.invalidToken:
      case ResultStatusCode.unauthenticated:
        if (onUnauthenticatedError != null) onUnauthenticatedError!();
        break;
      default:
    }
  }
}

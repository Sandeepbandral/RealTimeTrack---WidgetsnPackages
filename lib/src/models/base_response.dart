enum ResultStatusCode {
  error,
  succeed,
  unauthenticated,
  tokenExpired,
  invalidToken
}

class BaseResponse<T> {
  final ResultStatusCode code;
  final String description;
  final T? result;

  const BaseResponse({
    required this.code,
    required this.description,
    this.result,
  });

  factory BaseResponse.fromResponse(dynamic data) {
    return BaseResponse(
      code: ResultStatusCode.values[int.parse(data['resultCode'])],
      description: data['resultDescription'],
      result: data['result'],
    );
  }

  bool get isSucceed => code == ResultStatusCode.succeed;

  BaseResponse copyWith({
    ResultStatusCode? code,
    String? description,
    T? result,
  }) {
    return BaseResponse(
      code: code ?? this.code,
      description: description ?? this.description,
      result: result ?? result,
    );
  }

  @override
  String toString() {
    return 'BaseResponse(resultCode: $code, resultDescription: $description, result: $result)';
  }
}

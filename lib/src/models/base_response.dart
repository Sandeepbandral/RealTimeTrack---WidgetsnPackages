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
    Map<String, dynamic> map = Map<String, dynamic>.from(data);
    return BaseResponse(
      code: ResultStatusCode.values[int.parse(data['resultCode'])],
      description: map.containsKey('resultDescription')
          ? data['resultDescription']
          : map.containsKey('errorMessage')
              ? data['errorMessage'] is Map
                  ? Map<String, List<dynamic>>.from(data['errorMessage'])
                      .entries
                      .map((e) => '${e.key}: ${e.value.first}')
                      .join('\n')
                  : 'Unknown Error. Please try again.'
              : data['errorMessage'],
      result: data['result'],
    );
  }

  bool get isSucceeded => code == ResultStatusCode.succeed;

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

class BaseResponse<T> {
  final int code;
  final String description;
  final T? result;

  BaseResponse({
    required this.code,
    required this.description,
    this.result,
  });

  factory BaseResponse.fromResponse(dynamic data) {
    return BaseResponse(
      code: int.parse(data['resultCode']),
      description: data['resultDescription'],
      result: data['result'],
    );
  }

  bool get isSucceed => code == 1;

  BaseResponse copyWith({
    int? code,
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

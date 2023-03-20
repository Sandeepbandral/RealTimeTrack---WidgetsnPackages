abstract class Result<S, F> {
  T when<T>(T Function(S value) ifSuccess, T Function(F error) ifFailure);
}

class Success<S, F> extends Result<S, F> {
  final S _value;
  Success(this._value);

  S get value => _value;

  @override
  T when<T>(T Function(S s) ifSuccess, T Function(F f) ifFailure) =>
      ifSuccess(_value);
}

class Failure<S, F> extends Result<S, F> {
  final F _value;
  Failure(this._value);

  F get value => _value;

  @override
  T when<T>(T Function(S s) ifSuccess, T Function(F f) ifFailure) =>
      ifFailure(_value);
}

import 'package:dio/dio.dart';

class RttException implements Exception {
  final String message;
  final Response<dynamic>? response;

  const RttException(this.message, {this.response});

  @override
  String toString() {
    return 'BlueBotException(message: $message, response: ${response.toString()})';
  }
}

import 'package:dio/dio.dart';

class RttException implements Exception {
  final String message;
  final dynamic data;

  const RttException(this.message, {this.data});

  @override
  String toString() {
    return 'RttException(message: $message, response: $data)';
  }
}

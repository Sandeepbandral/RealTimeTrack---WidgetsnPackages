import 'dart:async';
import 'dart:convert';

import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

class WebSocketClient {
  final String url;

  WebSocketClient({required this.url});

  WebSocketChannel? _channel;

  StreamSubscription? _channelStreamSubscription;

  Function(Map<String, dynamic> data)? onListener;

  Future<void> connect() async {
    _channel = WebSocketChannel.connect(Uri.parse(url));
    await _channel?.ready;
    if (onListener != null) {
      _channelStreamSubscription = _channel?.stream.listen(
        (data) => onListener!(jsonDecode(data)),
        cancelOnError: true,
      );
    }
  }

  Stream<dynamic> get stream {
    if (_channel != null) {
      return _channel!.stream;
    }
    throw UnimplementedError();
  }

  Future<void> disconnect() async {
    await _channel?.sink.close(status.goingAway);
    if (_channelStreamSubscription != null) {
      _channelStreamSubscription?.cancel();
      _channelStreamSubscription = null;
    }
  }
}

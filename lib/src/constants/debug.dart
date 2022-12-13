class Debug {
  Debug._internal();

  factory Debug() => Debug._internal();

  static bool enabled = false;

  static void log(dynamic message) {
    if (enabled) {
      print('[DEBUG] $message');
    }
  }
}

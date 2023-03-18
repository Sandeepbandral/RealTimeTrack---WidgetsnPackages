import 'dart:convert';

import 'package:real_time_track_package/src/models/tokens.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  Preferences._();

  static final Preferences _instance = Preferences._();

  static SharedPreferences? _shared;

  final String _isLogged = 'is_logged';
  final String _tokens = 'tokens';

  static Future<void> init() async {
    _shared = await SharedPreferences.getInstance();
  }

  set isLogged(bool value) => _shared?.setBool(_isLogged, value);
  bool get isLogged => _shared?.getBool(_isLogged) ?? false;

  set tokens(Tokens value) {
    _shared?.setString(_tokens, jsonEncode(value.toMap()));
  }

  Tokens get tokens {
    String? encoded = _shared?.getString(_tokens);
    return encoded != null
        ? Tokens.fromMap(jsonDecode(encoded))
        : const Tokens.empty();
  }

  Future<void> clear() async {
    await _shared?.clear();
  }

  static Preferences get instance => _instance;
}

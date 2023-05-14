import 'dart:convert';

import 'package:real_time_track_package/real_time_track_package.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  Preferences._();

  static final Preferences _instance = Preferences._();

  static SharedPreferences? _shared;

  final String _isLogged = 'is_logged';
  final String _tokens = 'tokens';
  final String _organization = 'organization';
  final String _role = 'role';

  static Future<void> init() async {
    _shared = await SharedPreferences.getInstance();
  }

  set isLogged(bool value) => _shared?.setBool(_isLogged, value);
  bool get isLogged => _shared?.getBool(_isLogged) ?? false;

  set role(Role value) => _shared?.setInt(_role, value.index);
  Role get role => Role.values[_shared?.getInt(_role) ?? 0];

  set organization(Organization? value) {
    _shared?.setString(_organization, jsonEncode(value?.toMap()));
  }

  Organization? get organization {
    String? encoded = _shared?.getString(_organization);
    if (encoded != null) {
      return Organization.fromMap(jsonDecode(encoded));
    }
    return null;
  }

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

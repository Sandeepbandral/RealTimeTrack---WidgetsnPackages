import 'dart:convert';

import 'package:real_time_track_package/real_time_track_package.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  Preferences._();

  static final Preferences _instance = Preferences._();

  static SharedPreferences? _shared;

  final String _isLogged = 'is_logged';
  final String _tokens = 'tokens';
  final String _defaultCountry = 'default_country';

  // Only for Customer
  final String _notifications = 'notifications';

  // Only For Drivers
  final String _organization = 'organization';
  final String _role = 'role';
  final String _locationRefreshRate = 'location_refresh_rate';
  final String _keepScreenOn = 'keep_screen_on';

  static Future<void> init() async {
    _shared = await SharedPreferences.getInstance();
  }

  set isLogged(bool value) => _shared?.setBool(_isLogged, value);
  bool get isLogged => _shared?.getBool(_isLogged) ?? false;

  set role(Role value) => _shared?.setInt(_role, value.index);
  Role get role => Role.values[_shared?.getInt(_role) ?? 0];

  set notifications(bool value) => _shared?.setBool(_notifications, value);
  bool get notifications => _shared?.getBool(_notifications) ?? false;

  set organization(Organization? value) {
    _shared?.setString(_organization, jsonEncode(value?.toMap()));
  }

  set defaultCountry(Country country) {
    _shared?.setString(_defaultCountry, country.code);
  }

  Country get defaultCountry {
    String countryCode = _shared?.getString(_defaultCountry) ?? 'US';
    return Country.fromMap(
      Countries.allCountries.firstWhere((e) => e['code'] == countryCode),
    );
  }

  bool get notifications => _shared?.getBool(_notifications) ?? false;

  Organization? get organization {
    String? encoded = _shared?.getString(_organization);
    if (encoded != null) {
      return Organization.fromMap(jsonDecode(encoded));
    }
    return null;
  }

  set locationRefreshRate(Duration value) {
    _shared?.setInt(_locationRefreshRate, value.inSeconds);
  }

  Duration get locationRefreshRate {
    return Duration(seconds: _shared?.getInt(_locationRefreshRate) ?? 0);
  }

  set keepScreenOn(bool value) => _shared?.setBool(_keepScreenOn, value);
  bool get keepScreenOn => _shared?.getBool(_keepScreenOn) ?? false;

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

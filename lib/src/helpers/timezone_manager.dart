import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz_latest;

class Timezone {
  Timezone._();

  static final TimezoneManager _manager = TimezoneManager.instance;

  static DateTime now() => _manager.now();

  static DateTime parse(String formattedString) {
    return _manager.parse(formattedString);
  }
}

class TimezoneManager {
  const TimezoneManager._();

  static TimezoneManager get instance => const TimezoneManager._();

  static String? _localTimezone;

  static Future<void> init() async {
    tz_latest.initializeTimeZones();
    try {
      _localTimezone = await FlutterTimezone.getLocalTimezone();
    } catch (_) {
      // Do nothing
    }
  }

  tz.TZDateTime now() {
    tz.Location location = _ensureLocationByLocalTimezone();
    tz.TZDateTime dateTime = tz.TZDateTime.now(location);
    return dateTime;
  }

  tz.TZDateTime parse(String formattedString) {
    tz.Location location = _ensureLocationByLocalTimezone();
    tz.TZDateTime dateTime = tz.TZDateTime.parse(location, formattedString);
    return dateTime;
  }

  tz.Location _ensureLocationByLocalTimezone() {
    tz.Location location;
    try {
      if (_localTimezone == null) {
        throw const TimezoneNotFoundException('Local Timezone not found');
      }
      location = tz.getLocation(_localTimezone!);
    } catch (_) {
      location = tz.getLocation('UTC');
    }
    return location;
  }

  static String? get localTimezone => _localTimezone;
}

class TimezoneNotFoundException implements Exception {
  final String message;
  const TimezoneNotFoundException(this.message);
}

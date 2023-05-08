import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:real_time_track_package/real_time_track_package.dart';

abstract class PlatformService {
  static _PlatformInfoImpl get instance => _PlatformInfoImpl();

  Future<void> init();

  String? get deviceId;

  String? get deviceName;

  String get platform;
}

class _PlatformInfoImpl implements PlatformService {
  final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  bool _isInitialize = false;

  AndroidDeviceInfo? _androidInfo;
  IosDeviceInfo? _iosInfo;

  @override
  Future<void> init() async {
    try {
      _androidInfo = await _deviceInfo.androidInfo;
      _iosInfo = await _deviceInfo.iosInfo;
      _isInitialize = true;
    } catch (e) {
      Debug.log('PlatformService.init: $e');
    }
  }

  @override
  String? get deviceId {
    if (_isInitialize) {
      if (Platform.isIOS) {
        return _iosInfo?.identifierForVendor;
      } else if (Platform.isAndroid) {
        return _androidInfo?.id;
      }
      return null;
    } else {
      throw PlatformServiceInitialzedException();
    }
  }

  @override
  String? get deviceName {
    if (_isInitialize) {
      if (Platform.isIOS) {
        return _iosInfo?.name;
      } else if (Platform.isAndroid) {
        return _androidInfo?.device;
      }
      return null;
    } else {
      throw PlatformServiceInitialzedException();
    }
  }

  @override
  String get platform {
    if (Platform.isAndroid) {
      return 'android';
    } else if (Platform.isIOS) {
      return 'ios';
    } else {
      return 'unknown';
    }
  }
}

class PlatformServiceInitialzedException implements Exception {
  String message =
      'Ensure to initialize PlatformService before accessing it. Please execute the initialize method : init()';
}

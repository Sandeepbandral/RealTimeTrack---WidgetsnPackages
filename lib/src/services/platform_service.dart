import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:real_time_track_package/real_time_track_package.dart';

class DeviceInfo {
  final String? model;
  final String? version;
  final String? deviceId;
  final String? name;
  final String? type;

  const DeviceInfo({
    this.model,
    this.version,
    this.deviceId,
    this.name,
    this.type,
  });
}

abstract class PlatformService {
  static _PlatformInfoImpl get instance => _PlatformInfoImpl();

  Future<void> init();

  DeviceInfo? getDeviceInfo();
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
  DeviceInfo? getDeviceInfo() {
    bool isAndroid = Platform.isAndroid;

    if (_isInitialize) {
      return DeviceInfo(
        type: isAndroid ? 'android' : 'ios',
        deviceId: isAndroid ? _androidInfo?.id : _iosInfo?.identifierForVendor,
        name: isAndroid ? _androidInfo?.device : _iosInfo?.name,
        model: isAndroid ? _androidInfo?.model : _iosInfo?.model,
        version:
            isAndroid ? _androidInfo?.version.release : _iosInfo?.systemVersion,
      );
    } else {
      throw PlatformServiceInitialzedException();
    }
  }
}

class PlatformServiceInitialzedException implements Exception {
  String message =
      'Ensure to initialize PlatformService before accessing it. Please execute the initialize method : init()';
}

import 'package:real_time_track_package/src/app/app_config.dart';

export 'environment.dart';

class AppConfig {
  final Environment _environment;
  final String name;
  final Map<String, dynamic> _values;

  static AppConfig? _instance;

  factory AppConfig({
    required Environment environment,
    required Map<String, dynamic> values,
  }) {
    return _instance ??=
        AppConfig._(environment, environment.toString(), values);
  }

  const AppConfig._(this._environment, this.name, this._values);

  static AppConfig get instance {
    if (_instance != null) {
      return _instance!;
    } else {
      throw UnimplementedError();
    }
  }

  Map<String, dynamic> get values => _values;

  Environment get environment => _environment;
}

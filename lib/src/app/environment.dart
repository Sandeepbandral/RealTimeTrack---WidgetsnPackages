enum Environment { dev, staging, prod }

extension EnvironmentEx on Environment {
  bool get isProduction => this == Environment.prod;

  bool get isDevelopment => this == Environment.dev;

  bool get isStaging => this == Environment.staging;
}

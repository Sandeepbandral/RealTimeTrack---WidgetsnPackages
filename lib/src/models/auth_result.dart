class AuthResult {
  final String? accessToken;
  final String? refreshToken;
  final String? name;
  final String? email;
  final String? resultCode;
  final List<dynamic> role;
  final String? userTimezone;

  const AuthResult({
    this.accessToken,
    this.refreshToken,
    this.name,
    this.email,
    this.resultCode,
    this.role = const [],
    this.userTimezone,
  });

  factory AuthResult.fromMap(Map<String, dynamic> json) {
    return AuthResult(
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
      name: json['name'],
      email: json['email'],
      resultCode: json['resultCode'],
      role: json['role'] != null
          ? List<dynamic>.from(json['role'].map((x) => x))
          : [],
      userTimezone: json['user_timezone'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'access_token': accessToken,
      'refresh_token': refreshToken,
      'name': name,
      'email': email,
      'resultCode': resultCode,
      'role': List<dynamic>.from(role.map((x) => x)),
      'user_timezone': userTimezone,
    };
  }
}

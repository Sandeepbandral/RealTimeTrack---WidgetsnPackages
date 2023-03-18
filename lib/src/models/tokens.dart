import 'package:jwt_decoder/jwt_decoder.dart';

class Tokens {
  final String? accessToken;
  final String? refreshToken;

  const Tokens({this.accessToken, this.refreshToken});

  factory Tokens.fromMap(Map<String, dynamic> map) {
    return Tokens(
      accessToken: map['access_token'],
      refreshToken: map['refresh_token'],
    );
  }

  Jwt get jwt {
    Map<String, dynamic> decodedToken = JwtDecoder.decode(accessToken ?? '');
    return Jwt.fromMap(decodedToken);
  }

  Tokens.empty()
      : accessToken = null,
        refreshToken = null;

  Map<String, dynamic> toMap() {
    return {'access_token': accessToken, 'refresh_token': refreshToken};
  }
}

class Jwt {
  Jwt({
    required this.tokenType,
    required this.exp,
    required this.iat,
    required this.jti,
    required this.userId,
    required this.email,
    required this.schema,
  });

  final String tokenType;
  final DateTime exp;
  final DateTime iat;
  final String jti;
  final int userId;
  final String email;
  final String schema;

  factory Jwt.fromMap(Map<String, dynamic> map) {
    return Jwt(
      tokenType: map['token_type'],
      exp: DateTime.fromMillisecondsSinceEpoch(0)
          .add(Duration(seconds: map['exp'].toInt())),
      iat: DateTime.fromMillisecondsSinceEpoch(0)
          .add(Duration(seconds: map['iat'].toInt())),
      jti: map['jti'],
      userId: map['user_id'],
      email: map['email'],
      schema: map['schema'],
    );
  }

  bool get isExpired => DateTime.now().isAfter(exp);

  Map<String, dynamic> toMap() {
    return {
      'token_type': tokenType,
      'exp': exp,
      'iat': iat,
      'jti': jti,
      'user_id': userId,
      'email': email,
      'schema': schema,
    };
  }
}

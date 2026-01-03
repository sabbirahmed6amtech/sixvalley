class LoginRequest {
  final String emailOrPhone;
  final String password;
  final String type;

  LoginRequest({
    required this.emailOrPhone,
    required this.password,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    return {
      'email_or_phone': emailOrPhone,
      'password': password,
      'type': type,
    };
  }
}

class LoginResponse {
  final String? message;
  final String? token;
  final bool? success;

  LoginResponse({
    this.message,
    this.token,
    this.success,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      message: json['message'],
      token: json['token'],
      success: json['success'],
    );
  }
}

class RegisterRequest {
  final String fName;
  final String lName;
  final String phone;
  final String email;
  final String password;
  final String? referralCode;

  RegisterRequest({
    required this.fName,
    required this.lName,
    required this.phone,
    required this.email,
    required this.password,
    this.referralCode,
  });

  Map<String, dynamic> toJson() {
    return {
      'f_name': fName,
      'l_name': lName,
      'phone': phone,
      'email': email,
      'password': password,
      'referral_code': referralCode ?? '',
    };
  }
}

class RegisterResponse {
  final String? message;
  final bool? success;
  final String? token;
  final String? phone;

  RegisterResponse({
    this.message,
    this.success,
    this.token,
    this.phone,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      message: json['message'],
      success: json['success'],
      token: json['token'],
      phone: json['phone'],
    );
  }
}

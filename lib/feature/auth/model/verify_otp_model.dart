class VerifyOtpRequest {
  final String phone;
  final String token;

  VerifyOtpRequest({
    required this.phone,
    required this.token,
  });

  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'token': token,
    };
  }
}

class VerifyOtpResponse {
  final String? message;
  final bool? success;
  final String? token;

  VerifyOtpResponse({
    this.message,
    this.success,
    this.token,
  });

  factory VerifyOtpResponse.fromJson(Map<String, dynamic> json) {
    return VerifyOtpResponse(
      message: json['message'],
      success: json['success'],
      token: json['token'],
    );
  }
}

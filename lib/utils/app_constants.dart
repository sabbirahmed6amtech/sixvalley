import '../common/model/language_model.dart';

class AppConstants {
  AppConstants._();

  static const String appName = 'Six Valley';
  static const String appVersion = '1.0.0';

  // API Base URLs
  static const String baseUrl = 'https://grofresh-test.6amdev.xyz';
  static const String storeBaseUrl = 'https://mocki.io';
  static const String customerImageUrl = "https://grofresh-test.6amdev.xyz/storage/app/public/profile";
  static const String apiVersion = '/api/v1';

  // API Endpoints
  // Auth
  static const String loginUri = '/auth/login';
  static const String registerUri = '/auth/register';
  static const String verifyPhoneUri = '/auth/verify-phone';
  static const String checkPhoneUri = '/auth/check-phone';
  
  // Customer/Profile
  static const String customerInfoUri = '/customer/info';
  static const String updateProfileUri = '/customer/update-profile';

  // Store
  static const String storeApi = 'https://mocki.io/v1/7b04cbc7-68ab-456e-9146-3b4bb1892b90';

  // Shared Preferences Keys
  static const String theme = 'sixvalley_theme';
  static const String token = 'sixvalley_token';
  static const String rememberMe = '';
  static const String tempToken = 'sixvalley_temp_token';
  static const String pendingVerificationPhone = 'sixvalley_pending_verification_phone';
  static const String userId = 'sixvalley_user_id';
  static const String userRole = 'sixvalley_user_role';
  static const String languageCode = 'sixvalley_language_code';
  static const String countryCode = 'sixvalley_country_code';
  static const String searchHistory = 'sixvalley_search_history';
  static const String notification = 'sixvalley_notification';
  static const String acceptCookies = 'sixvalley_accept_cookies';
  static const String onboardingShown = 'sixvalley_onboarding_shown';

  // Firebase
  static const String firebaseProjectId = 'YOUR_PROJECT_ID';
  static const String firebaseApiKey = 'YOUR_API_KEY';

  // Limits
  static const int maxImageSizeInMB = 5;
  static const int searchHistoryLimit = 10;
  static const int itemsPerPage = 20;
  static const int otpResendTimer = 60;

  static List<LanguageModel> languages = [
    LanguageModel(languageName: 'English', countryCode: 'US', languageCode: 'en'),
    LanguageModel(languageName: 'عربى', countryCode: 'SA', languageCode: 'ar'),
    LanguageModel(languageName: 'বাংলা', countryCode: 'BD', languageCode: 'bn'),
    LanguageModel(languageName: 'Hindi', countryCode: 'IN', languageCode: 'hi'),
  ];

  // Categories
  static const List<String> popularCategories = [
    'Electronics',
    'Fashion',
    'Home & Garden',
    'Sports',
    'Books',
  ];
}

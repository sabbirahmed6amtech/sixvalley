class AppConstants {
  AppConstants._();

  static const String appName = 'Six Valley';
  static const String appVersion = '1.0.0';
  
  // API Base URLs
  static const String baseUrl = 'YOUR_BASE_URL_HERE';
  static const String apiVersion = '/api/v1';

  // Shared Preferences Keys
  static const String theme = 'sixvalley_theme';
  static const String token = 'sixvalley_token';
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

  // Categories
  static const List<String> popularCategories = [
    'Electronics',
    'Fashion',
    'Home & Garden',
    'Sports',
    'Books',
  ];
}

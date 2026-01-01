// ignore_for_file: unused_element

class Images {
  static String get logo => 'logo'.png;
  static String get profile => 'profile'.png;
  static String get banner1 => 'banner1'.png;
  static String get banner2 => 'banner2'.png;
  static String get bigSale => 'bigsale'.png;
  static String get featureProduct1 => 'fea_prod1'.png;
  static String get featureProduct2 => 'fea_prod2'.png;
  static String get featureProduct3 => 'fea_prod3'.png;
  static String get largeImage => 'lg_img'.png;
  static String get newExcusive1 => 'new1'.png;
  static String get newExcusive2 => 'new2'.png;
  static String get product2 => 'prod2'.png;
  static String get product3 => 'prod3'.png;
  static String get storeLogo1 => 'store_logo1'.png;
  static String get storeLogo2 => 'store_logo2'.png;
  static String get todaysDeal => 'todays_deal'.png;
  static String get todaysDealBackground => 'todays_deal_bg'.png;
  static String get upto20 => 'upto20'.png;
}

extension on String {
  String get png => 'assets/images/$this.png';
  String get jpg => 'assets/images/$this.jpg';
  String get json => 'assets/json/$this.json';
}
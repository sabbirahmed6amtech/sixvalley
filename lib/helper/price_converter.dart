class PriceConverter {
  static double convertWithDiscount(double price, double discount) {
      return price = price - ((discount / 100) * price);
  }
}

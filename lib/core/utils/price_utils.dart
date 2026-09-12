class PriceUtils {
  PriceUtils._();

  static String formatPrice(double price, {String symbol = '\$'}) {
    return '$symbol$price';
  }

  static double calculateOriginalPrice(
    double currentPrice,
    double discountPercentage,
  ) {
    if (discountPercentage <= 0 || discountPercentage >= 100) {
      return currentPrice;
    }
    return (currentPrice / (1 - (discountPercentage / 100))).ceilToDouble();
  }

  static String formatOriginalPrice(
    double currentPrice,
    double discountPercentage, {
    String symbol = '\$',
  }) {
    final original = calculateOriginalPrice(currentPrice, discountPercentage);
    return formatPrice(original, symbol: symbol);
  }

  static String formatDiscount(double discountPercentage) {
    return '$discountPercentage% OFF';
  }
}

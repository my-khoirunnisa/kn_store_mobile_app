class ApiEndpoints {
  ApiEndpoints._();

  static const String baseUrl = 'https://dummyjson.com';

  static const String products = '/products';
  static const String productSearch = '/products/search';

  static String productDetail(int id) => '$products/$id';
}

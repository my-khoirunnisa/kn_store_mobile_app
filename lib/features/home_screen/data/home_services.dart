import 'package:kn_store_mobile_app/core/constants/api_endpoints.dart';
import 'package:kn_store_mobile_app/core/network/api_client.dart';
import 'package:kn_store_mobile_app/features/home_screen/domain/product_model.dart';

class HomeServices {
  final ApiClient _apiClient;

  HomeServices(this._apiClient);

  Future<Products> fetchProducts({int limit = 10, int skip = 0}) async {
    try {
      final queryParams = <String, dynamic>{'limit': limit, 'skip': skip};
      final response = await _apiClient.get(
        ApiEndpoints.products,
        queryParameters: queryParams,
      );
      final data = response.data as Map<String, dynamic>;
      return Products.fromJson(data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Products> fetchBySearch({
    required String query,
    int limit = 10,
    int skip = 0,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'q': query,
        'limit': limit,
        'skip': skip,
      };
      final response = await _apiClient.get(
        ApiEndpoints.productSearch,
        queryParameters: queryParams,
      );
      final data = response.data as Map<String, dynamic>;
      return Products.fromJson(data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

import 'package:kn_store_mobile_app/core/constants/api_endpoints.dart';
import 'package:kn_store_mobile_app/core/network/api_client.dart';
import 'package:kn_store_mobile_app/features/home_screen/domain/product_model.dart';

class DetailServices {
  final ApiClient _apiClient;

  DetailServices(this._apiClient);

  Future<Product> fetchProductDetail(int id) async {
    try {
      final response = await _apiClient.get(ApiEndpoints.productDetail(id));
      final data = response.data as Map<String, dynamic>;
      return Product.fromJson(data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

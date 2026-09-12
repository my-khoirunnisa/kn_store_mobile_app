import 'package:flutter/material.dart';
import 'package:kn_store_mobile_app/features/detail_screen/data/detail_services.dart';
import 'package:kn_store_mobile_app/features/home_screen/domain/product_model.dart';

class DetailProvider extends ChangeNotifier {
  final DetailServices _detailService;

  DetailProvider(this._detailService);

  Product? _product;
  bool _isLoading = false;
  String? _error;

  Product? get product => _product;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchProductDetail(int id) async {
    _error = null;
    _setLoading(true);

    try {
      final fetchedProduct = await _detailService.fetchProductDetail(id);
      _product = fetchedProduct;
    } catch (e) {
      _error = e.toString();
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}

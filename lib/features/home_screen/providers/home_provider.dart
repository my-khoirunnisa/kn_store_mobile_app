import 'package:flutter/material.dart';
import 'package:kn_store_mobile_app/features/home_screen/data/home_services.dart';
import 'package:kn_store_mobile_app/features/home_screen/domain/product_model.dart';

class HomeProvider extends ChangeNotifier {
  final HomeServices _homeService;

  HomeProvider(this._homeService);

  List<Product> _products = [];
  String? _query;

  bool _isLoading = false;
  String? _error;

  bool _hasMore = true;
  bool _isLoadingMore = false;
  int _skip = 0;
  final int _limit = 10;

  List<Product> get products => _products;
  String get query => _query ?? "";
  bool get isLoading => _isLoading;
  String? get error => _error;

  bool get hasMore => _hasMore;
  bool get isLoadingMore => _isLoadingMore;

  Future<void> getInitialProducts() async {
    _skip = 0;
    _query = null;
    _hasMore = true;
    _error = null;
    _products = [];
    _setLoading(true);

    try {
      final data = await _homeService.fetchProducts(limit: _limit, skip: _skip);

      _products.clear();
      _products.addAll(data.products);
      _skip += data.products.length;

      _hasMore = data.total > _products.length;
    } catch (e) {
      _error = e.toString();
    } finally {
      _setLoading(false);
    }
  }

  Future<void> getMoreProducts() async {
    if (!_hasMore || _isLoadingMore || _isLoading) return;

    _setLoadingMore(true);

    try {
      final data = (_query != null && _query!.isNotEmpty)
          ? await _homeService.fetchBySearch(
              query: _query!,
              limit: _limit,
              skip: _skip,
            )
          : await _homeService.fetchProducts(limit: _limit, skip: _skip);

      _products.addAll(data.products);
      _skip += data.products.length;

      _hasMore = data.total > _products.length;
    } catch (e) {
      debugPrint('Error loading more products: $e');
    } finally {
      _setLoadingMore(false);
    }
  }

  Future<void> getProductBySearch({required String query}) async {
    _skip = 0;
    _query = query.trim();
    _hasMore = true;
    _error = null;
    _products = [];
    _setLoading(true);

    try {
      final data = _query!.isEmpty
          ? await _homeService.fetchProducts(limit: _limit, skip: _skip)
          : await _homeService.fetchBySearch(
              query: _query!,
              limit: _limit,
              skip: _skip,
            );

      _products.clear();
      _products.addAll(data.products);
      _skip += data.products.length;

      _hasMore = data.total > _products.length;
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

  void _setLoadingMore(bool value) {
    _isLoadingMore = value;
    notifyListeners();
  }
}

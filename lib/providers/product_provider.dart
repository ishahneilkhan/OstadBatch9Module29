import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/product.dart';
import 'package:flutter_ecommerce_app/services/api_service.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  List<Product> get products => _products;

  final ApiService apiService;

  ProductProvider(this.apiService);

  Future<void> fetchProducts() async {
    try {
      _products = await apiService.fetchProducts();
      notifyListeners();
    } catch (e) {
      throw Exception('Failed to load products');
    }
  }
}

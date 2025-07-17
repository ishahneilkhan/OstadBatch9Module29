import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_ecommerce_app/models/product.dart';

class ApiService {
  final String baseUrl = 'https://api.example.com/products'; // Replace with your API URL

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Product.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}

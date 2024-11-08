// Model
import 'dart:convert';

import 'package:mobile/models/product.dart';

// Services
import 'package:mobile/services/api_service.dart';
import 'package:mobile/services/token_service.dart';

class ProductService {
  final ApiService apiService = ApiService();
  final TokenService tokenService = TokenService();

  Future<List<Product>> getAllProduct() async {
    final response = await apiService.get('product/all');

    if (response.statusCode == 200) {
      List<dynamic> productList = json.decode(response.body);
      return productList.map((product) => Product.fromJson(product)).toList();
    } 
    else {
      throw Exception('Failed to load products');
    }
  }

  Future<List<Product>> getProductsByCategory(int categoryId) async {
    final response = await apiService.get('product/category/${categoryId}');

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    } 
    else {
      throw Exception('Failed to load products');
    }
  }
}
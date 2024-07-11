import 'dart:convert';
import 'package:glamify/models/ProductModel.dart';
import 'package:http/http.dart' as http;

class ProductProvider {
  final String _baseUrl = "https://fakestoreapi.com/products";

  Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(Uri.parse(_baseUrl));
    try {
      if (response.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(response.body);
        print(
            "data home json: ${jsonData.map((elemen) => elemen['id']).toList()}");
        List<ProductModel> results =
            jsonData.map((product) => ProductModel.fromJson(product)).toList();
        print("data home: ${results}");
        return jsonData
            .map((product) => ProductModel.fromJson(product))
            .toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('error: ${e.toString()}');
    }
  }

  Future<ProductModel> fetchProductById(int id) async {
    final response = await http.get(Uri.parse("$_baseUrl/$id"));

    if (response.statusCode == 200) {
      return ProductModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load product');
    }
  }

  Future<List<ProductModel>> fetchSimilarProducts(String category) async {
    final response = await http.get(Uri.parse("$_baseUrl/category/$category"));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((product) => ProductModel.fromJson(product)).toList();
    } else {
      throw Exception('Failed to load product');
    }
  }

  Future<void> addProduct(ProductModel product) async {
    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(product.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to add product');
    }
  }

  Future<void> updateProduct(ProductModel product) async {
    final response = await http.put(
      Uri.parse("$_baseUrl/${product.id}"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(product.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update product');
    }
  }

  Future<void> deleteProduct(int id) async {
    final response = await http.delete(Uri.parse("$_baseUrl/$id"));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete product');
    }
  }

  Future<List<dynamic>> getCategories() async {
    final response = await http.get(Uri.parse("$_baseUrl/categories"));
    try {
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        data.insert(0, "All");
        print(data);
        return data;
      }
      throw Exception('Failed to get category');
    } catch (e) {
      throw Exception('error message: ${e.toString()}');
    }
  }
}

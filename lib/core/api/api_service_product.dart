import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiServiceProduct {
  final String baseUrl = 'https://api.restful-api.dev/objects';

  // Obtener todos los productos
  Future<List<dynamic>> getProducts() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error al cargar productos');
    }
  }

  // Crear un nuevo producto
  Future<dynamic> createProduct(Map<String, dynamic> productData) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(productData),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error al crear producto');
    }
  }

  // Actualizar un producto existente
  Future<dynamic> updateProduct(
    String id,
    Map<String, dynamic> updatedData,
  ) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(updatedData),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error al actualizar producto');
    }
  }

  // Eliminar un producto
  Future<void> deleteProduct(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));
    if (response.statusCode != 200) {
      throw Exception('Error al eliminar producto');
    }
  }
}
//
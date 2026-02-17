import 'package:injectable/injectable.dart';
import 'package:drepto_healthcare/core/network/api_service.dart';
import 'package:drepto_healthcare/models/product.dart';
import 'package:drepto_healthcare/core/repositories/i_pharmacy_repository.dart';

@LazySingleton(as: IPharmacyRepository)
class PharmacyRepository implements IPharmacyRepository {
  @override
  Future<void> createProduct(Product product) async {
    await ApiService.post('/products', data: product.toJson());
  }

  @override
  Future<List<Product>> getAllProducts() async {
    final response = await ApiService.get('/products');
    final data = response.data as List<dynamic>;
    return data.map((json) => Product.fromJson(json)).toList();
  }

  @override
  Future<Product> getProductById(String id) async {
    final response = await ApiService.get('/products/$id');
    return Product.fromJson(response.data);
  }

  @override
  Future<void> updateProduct(String id, Map<String, dynamic> data) async {
    await ApiService.post('/products/$id', data: data);
  }

  @override
  Future<void> deleteProduct(String id) async {
    // Implement delete
  }
}

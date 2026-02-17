import 'package:drepto_healthcare/models/product.dart';

abstract class IPharmacyRepository {
  Future<void> createProduct(Product product);
  Future<List<Product>> getAllProducts();
  Future<Product> getProductById(String id);
  Future<void> updateProduct(String id, Map<String, dynamic> data);
  Future<void> deleteProduct(String id);
}

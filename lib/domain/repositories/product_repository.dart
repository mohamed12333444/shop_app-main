import '../entities/product.dart';

/// Abstract repository interface — domain layer defines the contract.
/// Data layer implements it. Clean Architecture principle.
abstract class ProductRepository {
  Future<List<Product>> getProducts();
  Future<Product> getProductById(String id);
  Future<List<Product>> getProductsByCategory(String category);
  Future<List<Product>> searchProducts(String query);
}

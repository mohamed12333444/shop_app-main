import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../sources/product_remote_source.dart';

/// Repository Implementation — Domain asks for data, RepositoryImpl decides where to get it.
/// If we had local DB + remote API, logic to choose between them goes here.
class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteSource _remoteSource;

  ProductRepositoryImpl(this._remoteSource);

  @override
  Future<List<Product>> getProducts() async {
    final models = await _remoteSource.fetchAllProducts();
    // Convert Data Models -> Domain Entities
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<Product> getProductById(String id) async {
    final model = await _remoteSource.fetchProductById(id);
    if (model == null) throw Exception('Product not found');
    return model.toEntity();
  }

  @override
  Future<List<Product>> getProductsByCategory(String category) async {
    final models = await _remoteSource.fetchAllProducts();
    return models
        .where((model) => model.category.toLowerCase() == category.toLowerCase())
        .map((model) => model.toEntity())
        .toList();
  }

  @override
  Future<List<Product>> searchProducts(String query) async {
    final models = await _remoteSource.fetchAllProducts();
    final lowerQuery = query.toLowerCase();
    return models
        .where((model) =>
            model.name.toLowerCase().contains(lowerQuery) ||
            model.category.toLowerCase().contains(lowerQuery) ||
            model.tags.any((tag) => tag.toLowerCase().contains(lowerQuery)))
        .map((model) => model.toEntity())
        .toList();
  }
}

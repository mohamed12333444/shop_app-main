import '../entities/product.dart';
import '../repositories/product_repository.dart';

/// Use Case: Get all products
/// Single-responsibility: only fetches all products
class GetProductsUseCase {
  final ProductRepository _repository;

  GetProductsUseCase(this._repository);

  Future<List<Product>> call() => _repository.getProducts();
}

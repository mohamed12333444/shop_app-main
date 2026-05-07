import '../entities/product.dart';
import '../repositories/product_repository.dart';

/// Use Case: Get product by ID
class GetProductDetailUseCase {
  final ProductRepository _repository;

  GetProductDetailUseCase(this._repository);

  Future<Product> call(String id) => _repository.getProductById(id);
}

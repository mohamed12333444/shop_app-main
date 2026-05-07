import '../entities/product.dart';

/// Factory Pattern — centralizes Product object creation logic.
/// Ensures consistent object construction regardless of data source.
class ProductFactory {
  ProductFactory._();

  /// Create a product from a raw map (e.g., API JSON response)
  static Product fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      price: (map['price'] as num).toDouble(),
      originalPrice: (map['original_price'] as num? ?? map['price'] as num).toDouble(),
      imageUrl: map['image_url'] as String,
      category: map['category'] as String,
      rating: (map['rating'] as num? ?? 0.0).toDouble(),
      reviewCount: map['review_count'] as int? ?? 0,
      isAvailable: map['is_available'] as bool? ?? true,
      tags: List<String>.from(map['tags'] as List? ?? []),
      specifications: Map<String, String>.from(
        map['specifications'] as Map? ?? {},
      ),
    );
  }

  /// Create a product with only required fields (for quick testing)
  static Product simple({
    required String id,
    required String name,
    required double price,
    required String imageUrl,
    required String category,
  }) {
    return Product(
      id: id,
      name: name,
      description: '',
      price: price,
      originalPrice: price,
      imageUrl: imageUrl,
      category: category,
      rating: 0,
      reviewCount: 0,
      isAvailable: true,
    );
  }
}

import '../../domain/entities/product.dart';

/// Data Model — extends domain entity with serialization capabilities
class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.name,
    required super.description,
    required super.price,
    required super.originalPrice,
    required super.imageUrl,
    required super.category,
    required super.rating,
    required super.reviewCount,
    required super.isAvailable,
    super.tags,
    super.specifications,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
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
      specifications: Map<String, String>.from(map['specifications'] as Map? ?? {}),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'original_price': originalPrice,
      'image_url': imageUrl,
      'category': category,
      'rating': rating,
      'review_count': reviewCount,
      'is_available': isAvailable,
      'tags': tags,
      'specifications': specifications,
    };
  }

  /// Convert model to domain entity (mapping layer)
  Product toEntity() => Product(
        id: id,
        name: name,
        description: description,
        price: price,
        originalPrice: originalPrice,
        imageUrl: imageUrl,
        category: category,
        rating: rating,
        reviewCount: reviewCount,
        isAvailable: isAvailable,
        tags: tags,
        specifications: specifications,
      );
}

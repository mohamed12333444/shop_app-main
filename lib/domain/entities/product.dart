// Domain Entity — pure business object, no Flutter/framework dependencies
class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final double originalPrice;
  final String imageUrl;
  final String category;
  final double rating;
  final int reviewCount;
  final bool isAvailable;
  final List<String> tags;
  final Map<String, String> specifications;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.originalPrice,
    required this.imageUrl,
    required this.category,
    required this.rating,
    required this.reviewCount,
    required this.isAvailable,
    this.tags = const [],
    this.specifications = const {},
  });

  double get discountPercentage {
    if (originalPrice <= price) return 0;
    return ((originalPrice - price) / originalPrice) * 100;
  }

  bool get hasDiscount => originalPrice > price;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Product && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

import '../models/product_model.dart';

/// Dummy remote data source — simulates an API with realistic products.
/// In production, replace with http/dio calls.
class ProductRemoteSource {
  ProductRemoteSource._();
  static final ProductRemoteSource _instance = ProductRemoteSource._();
  factory ProductRemoteSource() => _instance;

  /// Simulates a network delay
  Future<List<ProductModel>> fetchAllProducts() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return _products.map((e) => ProductModel.fromMap(e)).toList();
  }

  Future<ProductModel?> fetchProductById(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final map = _products.firstWhere(
      (p) => p['id'] == id,
      orElse: () => throw Exception('Product not found: $id'),
    );
    return ProductModel.fromMap(map);
  }

  static final List<Map<String, dynamic>> _products = [
    {
      'id': 'p001',
      'name': 'Sony WH-1000XM5',
      'description':
          'Industry-leading noise canceling headphones with Auto NC Optimizer. Up to 30-hour battery life with quick charge. Multi-point connection allows you to pair with two Bluetooth devices simultaneously.',
      'price': 299.99,
      'original_price': 399.99,
      'image_url': 'https://images.unsplash.com/photo-1484704849700-f032a568e944?w=600&h=600&fit=crop',
      'category': 'Electronics',
      'rating': 4.8,
      'review_count': 2341,
      'is_available': true,
      'tags': ['wireless', 'noise-canceling', 'premium'],
      'specifications': {
        'Battery Life': '30 hours',
        'Connectivity': 'Bluetooth 5.2',
        'Weight': '250g',
        'Driver Size': '30mm',
      },
    },
    {
      'id': 'p002',
      'name': 'Apple Watch Series 9',
      'description':
          'The most advanced Apple Watch yet. With the Double Tap gesture and a magical new chip, Series 9 helps you stay connected, active, and healthy.',
      'price': 399.00,
      'original_price': 429.00,
      'image_url': 'https://images.unsplash.com/photo-1551816230-ef5deaed4a26?w=600&h=600&fit=crop',
      'category': 'Electronics',
      'rating': 4.9,
      'review_count': 5612,
      'is_available': true,
      'tags': ['smartwatch', 'fitness', 'apple'],
      'specifications': {
        'Display': 'LTPO OLED Retina',
        'Water Resistance': '50m',
        'GPS': 'Built-in',
        'Storage': '64GB',
      },
    },
    {
      'id': 'p003',
      'name': 'Nike Air Max 270',
      'description':
          "Nike's first lifestyle Air Max shoe, inspired by two icons of big Air. The design draws from the Air Max 180 and Air Max 93 for an irresistibly clean look.",
      'price': 129.99,
      'original_price': 160.00,
      'image_url': 'https://images.unsplash.com/photo-1549298916-b41d501d3772?w=600&h=600&fit=crop',
      'category': 'Fashion',
      'rating': 4.6,
      'review_count': 8901,
      'is_available': true,
      'tags': ['running', 'sneakers', 'lifestyle'],
      'specifications': {
        'Material': 'Mesh & Synthetic',
        'Sole': 'Air Max unit',
        'Closure': 'Lace-up',
        'Style': 'Low-top',
      },
    },
    {
      'id': 'p004',
      'name': 'MacBook Pro 14"',
      'description':
          'MacBook Pro with M3 Pro chip. Up to 22 hours battery life. Liquid Retina XDR display with ProMotion technology. Perfect for professional workflows.',
      'price': 1999.00,
      'original_price': 2199.00,
      'image_url': 'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=600&h=600&fit=crop',
      'category': 'Electronics',
      'rating': 4.9,
      'review_count': 3201,
      'is_available': true,
      'tags': ['laptop', 'apple', 'professional'],
      'specifications': {
        'Chip': 'Apple M3 Pro',
        'RAM': '18GB',
        'Storage': '512GB SSD',
        'Display': '14.2" Liquid Retina XDR',
      },
    },
    {
      'id': 'p005',
      'name': 'Dyson V15 Detect',
      'description':
          'The most powerful, intelligent Dyson cordless vacuum. Laser reveals microscopic dust. Automatically adapts suction to the task. Captures allergens others leave behind.',
      'price': 649.99,
      'original_price': 749.99,
      'image_url': 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=600&h=600&fit=crop',
      'category': 'Home',
      'rating': 4.7,
      'review_count': 1230,
      'is_available': true,
      'tags': ['vacuum', 'cordless', 'cleaning'],
      'specifications': {
        'Run Time': 'Up to 60 min',
        'Suction': '230 AW',
        'Filtration': 'HEPA',
        'Weight': '3.1kg',
      },
    },
    {
      'id': 'p006',
      'name': 'The Ordinary Serum Set',
      'description':
          'A curated collection of The Ordinary\'s best-selling serums. Includes Hyaluronic Acid 2% + B5, Niacinamide 10% + Zinc 1%, and Vitamin C Suspension.',
      'price': 45.00,
      'original_price': 60.00,
      'image_url': 'https://images.unsplash.com/photo-1556228720-195a672e8a03?w=600&h=600&fit=crop',
      'category': 'Beauty',
      'rating': 4.5,
      'review_count': 4560,
      'is_available': true,
      'tags': ['skincare', 'serum', 'vegan'],
      'specifications': {
        'Volume': '30ml each',
        'Skin Type': 'All types',
        'Key Ingredient': 'Hyaluronic Acid',
        'Fragrance Free': 'Yes',
      },
    },
    {
      'id': 'p007',
      'name': 'Lululemon Align Leggings',
      'description':
          'Made with our softest, most buttery fabric, these leggings are designed for yoga and low-impact activities. Feels like a second skin, with four-way stretch.',
      'price': 98.00,
      'original_price': 118.00,
      'image_url': 'https://images.unsplash.com/photo-1506629905607-0b5b8b5b2b5b?w=600&h=600&fit=crop',
      'category': 'Sports',
      'rating': 4.8,
      'review_count': 6780,
      'is_available': true,
      'tags': ['yoga', 'athletic', 'womens'],
      'specifications': {
        'Material': 'Nulu fabric',
        'Waistband': 'High-rise',
        'Inseam': '28"',
        'Pockets': '1 side pocket',
      },
    },
    {
      'id': 'p008',
      'name': 'Atomic Habits',
      'description':
          'No. 1 bestselling book. An easy & proven way to build good habits & break bad ones. Over 10 million copies sold. Discover how tiny changes can lead to remarkable results.',
      'price': 16.99,
      'original_price': 27.99,
      'image_url': 'https://images.unsplash.com/photo-1544947950-fa07a98d237f?w=600&h=600&fit=crop',
      'category': 'Books',
      'rating': 4.9,
      'review_count': 98231,
      'is_available': true,
      'tags': ['self-help', 'productivity', 'bestseller'],
      'specifications': {
        'Author': 'James Clear',
        'Pages': '319',
        'Publisher': 'Avery',
        'Language': 'English',
      },
    },
    {
      'id': 'p009',
      'name': 'Samsung 65" QLED 4K TV',
      'description':
          'QLED 4K Smart TV with Quantum Dot technology. Neo Quantum Processor 4K. Object Tracking Sound+. Motion Xcelerator Turbo Pro for gaming.',
      'price': 1297.99,
      'original_price': 1599.99,
      'image_url': 'https://images.unsplash.com/photo-1593359677879-a4bb92f829d1?w=600&h=600&fit=crop',
      'category': 'Electronics',
      'rating': 4.6,
      'review_count': 2187,
      'is_available': true,
      'tags': ['television', '4K', 'smart-tv'],
      'specifications': {
        'Display': '65" QLED 4K',
        'Refresh Rate': '120Hz',
        'HDR': 'HDR10+',
        'OS': 'Tizen',
      },
    },
    {
      'id': 'p010',
      'name': 'Adidas Ultraboost 22',
      'description':
          'Engineered to deliver an incredible energy-returning run. Responsive BOOST midsole and a Primeknit+ upper that moves with your foot.',
      'price': 140.00,
      'original_price': 185.00,
      'image_url': 'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?w=600&h=600&fit=crop',
      'category': 'Sports',
      'rating': 4.7,
      'review_count': 5401,
      'is_available': true,
      'tags': ['running', 'performance', 'boost'],
      'specifications': {
        'Upper': 'Primeknit+',
        'Midsole': 'BOOST foam',
        'Outsole': 'Continental rubber',
        'Drop': '10mm',
      },
    },
    {
      'id': 'p011',
      'name': 'Kindle Paperwhite',
      'description':
          "The thinnest, lightest Kindle Paperwhite ever. Adjustable warm light. Waterproof. 6.8\" display with glare-free screen. Weeks of battery life.",
      'price': 139.99,
      'original_price': 159.99,
      'image_url': 'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=600&h=600&fit=crop',
      'category': 'Electronics',
      'rating': 4.7,
      'review_count': 15670,
      'is_available': true,
      'tags': ['ereader', 'amazon', 'reading'],
      'specifications': {
        'Display': '6.8" 300ppi',
        'Storage': '8GB',
        'Battery': 'Weeks',
        'Waterproof': 'IPX8',
      },
    },
    {
      'id': 'p012',
      'name': 'Le Creuset Dutch Oven',
      'description':
          'Enameled cast iron Dutch oven. Perfect for slow cooking, braising, and baking. Superior heat distribution and retention. Oven safe up to 500°F.',
      'price': 379.95,
      'original_price': 419.95,
      'image_url': 'https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=600&h=600&fit=crop',
      'category': 'Home',
      'rating': 4.9,
      'review_count': 3892,
      'is_available': true,
      'tags': ['cookware', 'cast-iron', 'kitchen'],
      'specifications': {
        'Capacity': '5.5 Qt',
        'Material': 'Enameled Cast Iron',
        'Oven Safe': 'Up to 500°F',
        'Dishwasher Safe': 'Yes',
      },
    },
    {
      'id': 'p013',
      'name': 'Logitech MX Master 3S',
      'description':
          'Advanced wireless mouse with ergonomic design. Ultra-fast scrolling, customizable buttons, and multi-device support. Perfect for productivity.',
      'price': 99.99,
      'original_price': 119.99,
      'image_url': 'https://images.unsplash.com/photo-1527814050087-3793815479db?w=600&h=600&fit=crop',
      'category': 'Electronics',
      'rating': 4.7,
      'review_count': 1520,
      'is_available': true,
      'tags': ['mouse', 'wireless', 'ergonomic'],
      'specifications': {
        'Connectivity': 'Bluetooth/USB',
        'Battery Life': '70 days',
        'DPI': '200-8000',
        'Weight': '141g',
      },
    },
    {
      'id': 'p014',
      'name': 'Cotton T-Shirt',
      'description':
          'Comfortable 100% cotton t-shirt. Soft fabric, classic fit. Available in multiple colors. Perfect for everyday wear.',
      'price': 19.99,
      'original_price': 24.99,
      'image_url': 'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=600&h=600&fit=crop',
      'category': 'Fashion',
      'rating': 4.5,
      'review_count': 3200,
      'is_available': true,
      'tags': ['t-shirt', 'cotton', 'casual'],
      'specifications': {
        'Material': '100% Cotton',
        'Fit': 'Regular',
        'Care': 'Machine Wash',
        'Sizes': 'S-XL',
      },
    },
    {
      'id': 'p015',
      'name': 'Table Lamp',
      'description':
          'Modern table lamp with adjustable brightness. LED bulb included. Sleek design that fits any room decor.',
      'price': 49.99,
      'original_price': 59.99,
      'image_url': 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=600&h=600&fit=crop',
      'category': 'Home',
      'rating': 4.6,
      'review_count': 890,
      'is_available': true,
      'tags': ['lamp', 'lighting', 'modern'],
      'specifications': {
        'Type': 'LED',
        'Wattage': '10W',
        'Voltage': '110-240V',
        'Color Temperature': '3000K',
      },
    },
    {
      'id': 'p016',
      'name': 'Red Lipstick',
      'description':
          'Long-lasting red lipstick. Creamy texture, vibrant color. Enriched with nourishing ingredients for soft lips.',
      'price': 12.99,
      'original_price': 15.99,
      'image_url': 'https://images.unsplash.com/photo-1586495777744-4413f21062fa?w=600&h=600&fit=crop',
      'category': 'Beauty',
      'rating': 4.4,
      'review_count': 2100,
      'is_available': true,
      'tags': ['lipstick', 'makeup', 'red'],
      'specifications': {
        'Finish': 'Matte',
        'Longevity': '8 hours',
        'Ingredients': 'Vitamin E',
        'Shade': 'Classic Red',
      },
    },
    {
      'id': 'p017',
      'name': 'Yoga Mat',
      'description':
          'Non-slip yoga mat made from eco-friendly materials. Perfect for yoga, pilates, and exercise. Lightweight and easy to carry.',
      'price': 29.99,
      'original_price': 39.99,
      'image_url': 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?w=600&h=600&fit=crop',
      'category': 'Sports',
      'rating': 4.8,
      'review_count': 1450,
      'is_available': true,
      'tags': ['yoga', 'mat', 'exercise'],
      'specifications': {
        'Material': 'TPE',
        'Thickness': '6mm',
        'Size': '183x61cm',
        'Weight': '2.5kg',
      },
    },
    {
      'id': 'p018',
      'name': 'The Alchemist',
      'description':
          'A philosophical novel by Paulo Coelho. Follow Santiago\'s journey of self-discovery and following dreams. A timeless classic.',
      'price': 14.99,
      'original_price': 19.99,
      'image_url': 'https://images.unsplash.com/photo-1544947950-fa07a98d237f?w=600&h=600&fit=crop',
      'category': 'Books',
      'rating': 4.9,
      'review_count': 50000,
      'is_available': true,
      'tags': ['novel', 'philosophy', 'inspiration'],
      'specifications': {
        'Author': 'Paulo Coelho',
        'Pages': '208',
        'Language': 'English',
        'Genre': 'Fiction',
      },
    },
  ];
}

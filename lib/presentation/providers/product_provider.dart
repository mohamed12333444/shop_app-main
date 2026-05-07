import 'package:flutter/foundation.dart';
import '../../domain/entities/product.dart';
import '../../domain/usecases/get_products_usecase.dart';

enum ProductState { initial, loading, loaded, error }

/// MVVM Pattern — This is the ViewModel for Product lists.
class ProductProvider extends ChangeNotifier {
  final GetProductsUseCase _getProductsUseCase;

  ProductProvider(this._getProductsUseCase);

  ProductState _state = ProductState.initial;
  ProductState get state => _state;

  List<Product> _products = [];
  List<Product> get products => _products;

  List<Product> _filteredProducts = [];
  List<Product> get filteredProducts => _filteredProducts;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  String _selectedCategory = 'All';
  String get selectedCategory => _selectedCategory;

  String _searchQuery = '';

  List<String> get categories {
    final cats = _products.map((p) => p.category).toSet().toList();
    cats.insert(0, 'All');
    return cats;
  }

  Future<void> fetchProducts() async {
    _state = ProductState.loading;
    notifyListeners();

    try {
      _products = await _getProductsUseCase();
      _applyFilters();
      _state = ProductState.loaded;
    } catch (e) {
      _errorMessage = e.toString();
      _state = ProductState.error;
    }
    notifyListeners();
  }

  void filterByCategory(String category) {
    if (_selectedCategory == category) return;
    _selectedCategory = category;
    _applyFilters();
    notifyListeners();
  }

  void search(String query) {
    if (_searchQuery == query) return;
    _searchQuery = query;
    _applyFilters();
    notifyListeners();
  }

  void _applyFilters() {
    _filteredProducts = _products;

    if (_selectedCategory != 'All') {
      _filteredProducts = _filteredProducts
          .where((p) => p.category == _selectedCategory)
          .toList();
    }

    if (_searchQuery.isNotEmpty) {
      final query = _searchQuery.toLowerCase();
      _filteredProducts = _filteredProducts
          .where((p) =>
              p.name.toLowerCase().contains(query) ||
              p.category.toLowerCase().contains(query))
          .toList();
    }
  }
}

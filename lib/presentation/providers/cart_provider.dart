import 'package:flutter/foundation.dart';
import '../../domain/entities/cart_item.dart';
import '../../domain/entities/product.dart';

/// Singleton Pattern — cart state should be singular across the entire app.
/// Managed via a single CartProvider instance injected at the root.
class CartProvider extends ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => {..._items};

  int get itemCount => _items.length;

  int get totalItems {
    int total = 0;
    _items.forEach((key, item) => total += item.quantity);
    return total;
  }

  double get subtotalAmount {
    double total = 0.0;
    _items.forEach((key, item) => total += item.subTotal);
    return total;
  }
  
  double get shippingFee {
    return subtotalAmount > 50.0 || items.isEmpty ? 0.0 : 10.0;
  }

  double get totalAmount => subtotalAmount + shippingFee;

  void addItem(Product product, {int quantity = 1}) {
    if (_items.containsKey(product.id)) {
      // Update quantity
      _items.update(
        product.id,
        (existing) => existing.copyWith(quantity: existing.quantity + quantity),
      );
    } else {
      // Add new
      _items.putIfAbsent(
        product.id,
        () => CartItem(product: product, quantity: quantity),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void decreaseQuantity(String productId) {
    if (!_items.containsKey(productId)) return;

    if (_items[productId]!.quantity > 1) {
      _items.update(
        productId,
        (existing) => existing.copyWith(quantity: existing.quantity - 1),
      );
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}

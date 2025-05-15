import 'package:flutter/material.dart';

// Model for cart item
class CartItem {
  final String name;
  final double price;
  int quantity;
  final String image;

  CartItem({
    required this.name,
    required this.price,
    required this.quantity,
    required this.image,
  });
}

class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  double get totalPrice =>
      _items.fold(0, (sum, item) => sum + item.price * item.quantity);

  int get itemsCount => _items.fold(0, (sum, item) => sum + item.quantity);

  void addItem(CartItem item) {
    final index = _items.indexWhere((i) => i.name == item.name);
    if (index >= 0) {
      _items[index].quantity += 1;
    } else {
      _items.add(item);
    }
    notifyListeners();
  }

  void removeItem(CartItem item) {
    _items.removeWhere((i) => i.name == item.name);
    notifyListeners();
  }

  void increaseQuantity(CartItem item) {
    item.quantity += 1;
    notifyListeners();
  }

  void decreaseQuantity(CartItem item) {
    if (item.quantity > 1) {
      item.quantity -= 1;
    } else {
      removeItem(item);
    }
    notifyListeners();
  }
}

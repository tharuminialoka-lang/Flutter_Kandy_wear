import 'package:flutter/material.dart';

class CartItem {
  final String name;
  final String price; // example: "Rs. 2500"
  final String image;
  int quantity;

  CartItem({
    required this.name,
    required this.price,
    required this.image,
    this.quantity = 1,
  });
}

class CartModel extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  // Add item (MAX 10 limit)
  void addItem(CartItem item) {
    final index = _items.indexWhere((i) => i.name == item.name);

    if (index >= 0) {
      if (_items[index].quantity < 10) {
        _items[index].quantity++;
      }
    } else {
      _items.add(item);
    }
    notifyListeners();
  }

  // Increase quantity (MAX 10)
  void increaseQuantity(CartItem item) {
    if (item.quantity < 10) {
      item.quantity++;
      notifyListeners();
    }
  }

  // Decrease quantity
  void decreaseQuantity(CartItem item) {
    if (item.quantity > 1) {
      item.quantity--;
    } 
    notifyListeners();
  }

  // Remove item
  void removeItem(CartItem item) {
    _items.remove(item);
    notifyListeners();
  }

  // FIXED total price calculation
  double get totalPrice {
  double total = 0.0;

  for (var item in _items) {
    // Remove everything except digits
    final cleanedPrice = item.price.replaceAll(RegExp(r'[^0-9]'), '');

    // Parse as integer
    final numericPrice = int.tryParse(cleanedPrice) ?? 0;

    // Multiply by quantity and convert to double
    total += numericPrice.toDouble() * item.quantity;
  }

  return total;
}}
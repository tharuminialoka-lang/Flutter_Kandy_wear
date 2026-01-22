import 'package:flutter/material.dart';

class CartItem {
  final String name;
  final String price;
  final String image;

  CartItem({required this.name, required this.price, required this.image});
}

class CartModel extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(CartItem item) {
    _items.add(item);
    notifyListeners();
  }
  void removeItem(CartItem item) {
  _items.remove(item);
  notifyListeners();
  }


  double get totalPrice {
    double total = 0.0;
    for (var item in _items) {
      final numericPrice = double.tryParse(item.price.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
      total += numericPrice;
    }
    return total;
  }
}

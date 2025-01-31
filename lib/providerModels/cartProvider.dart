import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  void addToCart(Map<String, dynamic> product) {
    int existingIndex =
        _cartItems.indexWhere((item) => item['id'] == product['id']);

    if (existingIndex != -1) {
      // If product already exists, update its quantity
      _cartItems[existingIndex]['quantity'] = product['quantity'];
    } else {
      // Otherwise, add it as a new item
      _cartItems.add(product);
    }
    if (product['quantity'] == 0) {
      _cartItems.removeAt(existingIndex);
    }

    notifyListeners();
  }

  double get totalPrice {
    return _cartItems.fold(
        0, (sum, item) => sum + (item['price'] * item['quantity']));
  }
}

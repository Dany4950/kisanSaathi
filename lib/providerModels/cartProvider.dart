import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier{
  final List<Map<String, dynamic>> _cartItems = [];
  
  List<Map<String, dynamic>> get cartItems => _cartItems;
  
  void addToCart(Map<String, dynamic> product) {
    int existingIndex = _cartItems.indexWhere((item) => item['id'] == product['id']);
    
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
  
  void updateQuantity(String productId, int newQuantity) {
    final index = _cartItems.indexWhere((item) => item['id'] == productId);
    
    if (index != -1) {
      if (newQuantity > 0) {
        _cartItems[index]['quantity'] = newQuantity;
      } else {
        // If quantity is 0 or negative, remove the item
        _cartItems.removeAt(index);
      }
      
      notifyListeners();
    }
  }
  
  void removeFromCart(String productId) {
    _cartItems.removeWhere((item) => item['id'] == productId);
    notifyListeners();
  }
  
  double calculateTotal() {
    return _cartItems.fold(0, (sum, item) => sum + (item['price'] * item['quantity']));
  }
  

  double get totalPrice {
    return _cartItems.fold(0, (sum, item) => sum + (item['price'] * item['quantity']));
  }
}
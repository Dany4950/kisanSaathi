import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _products = [
    {"id": "1", "name": "Laptop", "price": 59999, "imageUrl": "assets/images/appLogo.png","description":"lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem "},
    {"id": "2", "name": "Smartphone", "price": 39999, "imageUrl": "assets/images/appLogo.png","description":"lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem "},
    {"id": "3", "name": "Shoes", "price": 2999, "imageUrl": "assets/images/appLogo.png","description":"lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem "},
    {"id": "4", "name": "Watch", "price": 4999, "imageUrl": "assets/images/appLogo.png","description":"lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem "},
  ];

  List<Map<String, dynamic>> get products => _products;

  Map<String, dynamic>? getProductById(String id) {
    return _products.firstWhere((product) => product['id'] == id, orElse: () => {});
  }
}

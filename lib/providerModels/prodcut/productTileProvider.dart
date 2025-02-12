import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _products = [
    {
      "id": "1",
      "name": "Front Wheel Bearing",
      "price": 123,
      "imageUrl": "assets/images/Hydrolic Pipe.png",
      "description": "Tractor Hydraulic Male Female Coupling "
          " Size =1/2 ,3/4 Inches"
          " , Material = Mild Steel"
          "Thread Size = 1/2,3/4"
    },
    {
      "id": "2",
      "name": "Hydraulic Tractor Trolley Hose",
      "price": 39999,
      "imageUrl": "assets/images/Hydraulic Tractor Trolley Hose.png",
      "description": "Type : Hydraulic "
          " Model Name/Number : tractor/trolley "
          "Working Pressure : 2610"
          "Diameter : 1 to 3 inch, 3/8"
    },
    {
      "id": "3",
      "name": "Oil Filter",
      "price": 2999,
      "imageUrl": "assets/images/Oil Filter.png",
      "description":
          "lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem "
    },
    {
      "id": "4",
      "name": "Checknut",
      "price": 4999,
      "imageUrl": "assets/images/Checknut.png",
      "description": "Material : Mild Steel"
          "Thread Size (inch) : M6"
          "Product Shape :Round"
    },
    {
      "id": "5",
      "name": "Center Pin",
      "price": 4999,
      "imageUrl": "assets/images/Center Pin.png",
      "description": "Material : Mild Steel"
          "Thread Size (inch) : -"
          "Product Shape : pin "
    },
    {
      "id": "6",
      "name": "Break Paddle",
      "price": 4999,
      "imageUrl": "assets/images/Break Paddle.png",
      "description": "Size : 8 inch "
          "Material : Mild Steel"
          "Features  :  Rust Proof "
          "Usage  : Tractor "
    },
    {
      "id": "7",
      "name": "Engine Oil Filter",
      "price": 4999,
      "imageUrl": "assets/images/ Engine Oil Filter.png",
      "description": "Size : 8 inch "
          "Material : Mild Steel"
          "Features  :  Rust Proof "
          "Usage  : Tractor "
    },
  ];

  List<Map<String, dynamic>> get products => _products;

  Map<String, dynamic>? getProductById(String id) {
    return _products.firstWhere((product) => product['id'] == id,
        orElse: () => {});
  }
}

import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _products = [
    {
      "id": "1",
      "name": "Front Wheel Bearing",
      "price": 884,
      "imageUrl": "assets/images/front wheel bearing.png",
      "description": "Tractor Hydraulic Male Female Coupling "
          " Size =1/2 ,3/4 Inches",
      "Material":"Mild Steel",
      "Pieces":"3",
      "Status" : "156 items left"
    },
    {
      "id": "2",
      "name": "Hydraulic Tractor Trolley Hose",
      "price": 120,
      "imageUrl": "assets/images/Hydraulic Tractor Trolley Hose.png",
      "description": "Type : Hydraulic "
          " Model Name/Number : tractor/trolley "
          "Working Pressure : 2610"
          "Diameter : 1 to 3 inch, 3/8",
            "Pieces":"3",
      "Status" : "156 items left"
            ,"Material":"Mild Steel",

    },
    {
      "id": "3",
      "name": "Oil Filter",
      "price": 150,
      "imageUrl": "assets/images/Oil Filter.png",
      "description":
          "lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem ",
            "Pieces":"3",
      "Status" : "156 items left"
      ,      "Material":"Mild Steel",
    },
    {
      "id": "4",
      "name": "Checknut",
      "price": 2,
      "imageUrl": "assets/images/Checknut.png",
      "description": "Material : Mild Steel"
          "Thread Size (inch) : M6"
          "Product Shape :Round"
,
      "Pieces":"3",
      "Status" : "156 items left"
    },
    {
      "id": "5",
      "Material":"Mild Steel",
      "name": "Center Pin",
      "price": 290,
      "imageUrl": "assets/images/Center Pin.png",
      "description":  "Thread Size (inch) : -"
          "Product Shape : pin ",

      "Pieces":"3",
      "Status" : "156 items left"
    },
    {
      "id": "6",
      "name": "Break Paddle",
      "price": 240,
      "imageUrl": "assets/images/Break Paddle.png",
      "description": "Size : 8 inch "
          "Material : Mild Steel"
          "Features  :  Rust Proof "
          "Usage  : Tractor "
,
      "Pieces":"3",
      "Status" : "156 items left"
    },
    {
      "id": "7",
      "name": "Engine Oil Filter",
      "price": 7500,
      "imageUrl": "assets/images/ Engine Oil Filter.png",
      "description": "Size : 8 inch "
          "Material : Mild Steel"
          "Features  :  Rust Proof "
          "Usage  : Tractor ",

      "Pieces":"3",
      "Status" : "156 items left"
    },
    {
      "id": "8",
      "name": "Hydraulic Pipe ",
      "price": 200,
      "imageUrl": "assets/images/Hydrolic Pipe.png",
      "description": "Size : 8 inch "
          "Material : Mild Steel"
          "Features  :  Rust Proof "
          "Usage  : Tractor ",
            "Material":"Mild Steel",
      "Pieces":"3",
      "Status" : "156 items left"
    },
  ];

  List<Map<String, dynamic>> get products => _products;

  Map<String, dynamic>? getProductById(String id) {
    return _products.firstWhere((product) => product['id'] == id,
        orElse: () => {});
  }
}

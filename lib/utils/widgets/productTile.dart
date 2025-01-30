import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  final String imageUrl;
  final String name;
  final double price;


  const ProductTile({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.price,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.deepOrangeAccent,
      child: Row(
        children: [
          Image.asset(imageUrl, height: 200, width: 200, fit: BoxFit.cover),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text('₹$price',
                  style: TextStyle(fontSize: 16, color: Colors.green)),
            ],
          ),
        ],
      ),
    );
  }
}

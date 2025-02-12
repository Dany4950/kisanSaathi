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
      child: Padding(
        padding: const EdgeInsets.all(8.0), // Adding padding for better spacing
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image with fixed size
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                imageUrl,
                height: 200,
                width: 200,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 10), // Space between image and text
            // Text section to expand and wrap if needed
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    softWrap: true,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '₹$price',
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

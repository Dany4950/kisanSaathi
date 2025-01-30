import 'package:flutter/material.dart';
import 'package:kisan_saathi/providerModels/prodcut/productTile.dart';

import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  final String productId;

  const ProductDetailScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final product = productProvider.getProductById(productId);

    if (product == null || product.isEmpty) {
      return const Scaffold(
        body: Center(child: Text("Product not found")),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(product['name'])),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Image.asset(product['imageUrl'], width: 350, height: 350),
          const SizedBox(height: 20),
          Text(
            product['name'],
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text("Price: ₹${product['price']}",
              style: const TextStyle(fontSize: 18)),
          Text("About it : ${product['description']}",
              style: const TextStyle(fontSize: 18))
        ],
      ),
    );
  }
}

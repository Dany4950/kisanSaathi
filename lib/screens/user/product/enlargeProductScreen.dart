import 'package:flutter/material.dart';
import 'package:kisan_saathi/providerModels/addToCartProvider.dart';
import 'package:kisan_saathi/providerModels/cartProvider.dart';
import 'package:kisan_saathi/providerModels/prodcut/productTileProvider.dart';
import 'package:kisan_saathi/screens/user/cart/cart.dart';

import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  final String productId;

  const ProductDetailScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final product = productProvider.getProductById(productId);
    final productPriceProvider = Provider.of<ProductProvider>(context);
    final productPrice = productPriceProvider.getProductById(productId);

    Color? buttonGreenColor = const Color.fromRGBO(0, 117, 55, 1);
    // Access cart provider correctly
    final cartProvider = Provider.of<AddtocartProvider>(context);
    final itemsCountInCart = cartProvider.numberOfItems;

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
              style: const TextStyle(fontSize: 18, color: Colors.green)),
          Text("About it : ${product['description']}",
              style: const TextStyle(fontSize: 18)),
          const SizedBox(height: 30),

          // all the cart related details including count and price
          Row(
            children: [
              const SizedBox(width: 30),
              //minus button
              Container(
                height: 35,
                width: 40,
                decoration: BoxDecoration(border: Border.all()),
                child: TextButton(
                  onPressed: () {
                    cartProvider.decrement();
                  },
                  child: const Icon(Icons.exposure_minus_1),
                ),
              ),

              //number of items selected
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text("$itemsCountInCart"),
              ),

              //plus button
              Container(
                height: 35,
                width: 40,
                decoration: BoxDecoration(border: Border.all()),
                child: TextButton(
                  onPressed: () {
                    cartProvider.increment();
                  },
                  child: const Icon(Icons.plus_one),
                ),
              ),
              SizedBox(
                width: 110,
              ),
              Column(
                children: [
                  const Text(
                    "SubTotal",
                  ),
                  Text(
                    " ₹${product['price'] * itemsCountInCart}",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 35,
          ),
          SizedBox(
            width: 400,
            height: 80,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonGreenColor,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10), // Optional rounded corners
                ),
              ),
              onPressed: () {
                final cartProvider =
                    Provider.of<CartProvider>(context, listen: false);

                cartProvider.addToCart({
                  "id": productId,
                  "name": product['name'],
                  "price": product['price'],
                  "quantity": itemsCountInCart, // Use selected quantity
                  "imageUrl": product['imageUrl']
                });

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => cartScreen()),
                );
              },
              child: const Text(
                "Add to Cart ",
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

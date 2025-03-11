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
      appBar: AppBar(
          backgroundColor: Colors.grey[200], title: Text(product['name'])),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: Image.asset(
                product['imageUrl'],
                width: 300,
                height: 230,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 15),
            const CustomBox(
              text: "Tractor",
              text1: "Category",
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, top: 10),
              child: Text(
                " ₹${product['price']}",
                style: const TextStyle(
                    color: const Color.fromARGB(255, 16, 124, 20),
                    fontSize: 29,
                    fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 12),
            const FullWidthText(
              startText: "Details",
              endText: "",
            ),
            const SizedBox(height: 10),
            FullWidthText(
              startText: "Material",
              endText: "${product['Material']} ",
            ),
            const SizedBox(height: 10),
            FullWidthText(
              startText: "Pieces",
              endText: "${product['Peices']}",
            ),
            const SizedBox(height: 10),
            FullWidthText(
              startText: "Status",
              endText: "${product['Status']}",
            ),
            const SizedBox(height: 10),

            // all the cart related details including count and price
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text("You picked $itemsCountInCart items"),
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    const Text(
                      "SubTotal",
                    ),
                  ],
                ),
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
                    const SizedBox(
                      width: 80,
                    ),
                    Column(
                      children: [
                        Text(
                          " ₹${product['price'] * itemsCountInCart}",
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: SizedBox(
                width: 350,
                height: 60,
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
                      MaterialPageRoute(builder: (context) => cartScreen(
                        productId: product['id']
                      )),
                    );
                  },
                  child: const Text(
                    "Add to Cart ",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomBox extends StatelessWidget {
  final String text;
  final String text1;
  const CustomBox({required this.text, required this.text1});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 30,
        ),
        Container(
          width: 80,
          height: 38,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 16, 124, 20),
            borderRadius: BorderRadius.circular(7),
          ),
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          width: 14,
        ),
        Container(
          width: 100,
          height: 38,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 16, 124, 20),
            borderRadius: BorderRadius.circular(7),
          ),
          child: Text(
            text1,
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}

class FullWidthText extends StatelessWidget {
  final String startText;
  final String endText;

  const FullWidthText({
    Key? key,
    required this.startText,
    required this.endText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Aligns text to start
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                startText,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                endText,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 5), // Spacing before the divider
          const Divider(
            color: Colors.grey,
            thickness: 1, // Make it visible
          ),
        ],
      ),
    );
  }
}

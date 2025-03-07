import 'package:flutter/material.dart';
import 'package:kisan_saathi/providerModels/cartProvider.dart';
import 'package:kisan_saathi/screens/user/cart/checkoutScree.dart';
import 'package:provider/provider.dart';

class cartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Text("Your Cart")),
      body: cartProvider.cartItems.isEmpty
          ? Center(child: Text('Your cart is empty'))
          : ListView.builder(
              itemCount: cartProvider.cartItems.length,
              itemBuilder: (context, index) {
                final item = cartProvider.cartItems[index];
                return ListTile(
                  title: Text(item['name']),
                  subtitle: Text("₹${item['price']} x ${item['quantity']} "),
                  trailing: Text(
                    "=  ₹${item['price'] * item['quantity']} ",
                    style: TextStyle(fontSize: 23),
                  ),
                );
              },
            ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Text(
              "Total Amount : ₹${cartProvider.totalPrice}",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: 370,
            height: 70,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                // Add your checkout logic here
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Checkoutscreen()),
                );
              },
              child: Text(
                "Checkout",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }
}

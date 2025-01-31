import 'package:flutter/material.dart';
import 'package:kisan_saathi/providerModels/cartProvider.dart';
import 'package:provider/provider.dart';

class cartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    
    return Scaffold(
      appBar: AppBar(title: Text("Your Cart")),
      body: ListView.builder(
        itemCount: cartProvider.cartItems.length,
        itemBuilder: (context, index) {
          final item = cartProvider.cartItems[index];
          return ListTile(
            title: Text(item['name']),
            subtitle: Text("₹${item['price']} x ${item['quantity']}"),
            trailing: Text("₹${item['price'] * item['quantity']}"),
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        child: Text(
          "Total: ₹${cartProvider.totalPrice}",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:kisan_saathi/providerModels/addToCartProvider.dart';
// import 'package:kisan_saathi/providerModels/cartProvider.dart';
// import 'package:kisan_saathi/providerModels/prodcut/productTileProvider.dart';
// import 'package:kisan_saathi/screens/user/cart/checkoutScree.dart';
// import 'package:provider/provider.dart';

// class cartScreen extends StatelessWidget {
//   final String productId;
//   const cartScreen({super.key, required this.productId});
//   @override
//   Widget build(BuildContext context) {
//     final cartProvider = Provider.of<CartProvider>(context);
//     final plusProvider = Provider.of<AddtocartProvider>(context);
//     final itemsCountInCart = plusProvider.numberOfItems;
//     final productProvider = Provider.of<ProductProvider>(context);
//     final product = productProvider.getProductById(productId);
//     final productPriceProvider = Provider.of<ProductProvider>(context);
//     final productPrice = productPriceProvider.getProductById(productId);

//     return Scaffold(
//       appBar:
//           AppBar(backgroundColor: Colors.grey[200], title: Text("Your Cart")),
//       body: cartProvider.cartItems.isEmpty
//           ? Center(child: Text('Your cart is empty'))
//           : ListView.builder(
//               itemCount: cartProvider.cartItems.length,
//               itemBuilder: (context, index) {
//                 final item = cartProvider.cartItems[index];
//                 return Dismissible(
//                   key: Key(item['id'].toString()),
//                   background: Container(
//                     color: Colors.red,
//                     alignment: Alignment.centerRight,
//                     padding: EdgeInsets.symmetric(horizontal: 20),
//                     child: Icon(
//                       Icons.delete,
//                       color: Colors.white,
//                     ),
//                   ),
//                   direction: DismissDirection.endToStart,
//                   onDismissed: (direction) {
//                     // Remove the item from the cart

//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text('${item['name']} removed from cart'),
//                         duration: Duration(seconds: 2),
//                       ),
//                     );
//                   },
//                   child: Card(
//                     margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                     child: Padding(
//                       padding: EdgeInsets.all(8),
//                       child: Row(
//                         children: [
//                           // Product Image
//                           Container(
//                             width: 70,
//                             height: 70,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             clipBehavior: Clip.antiAlias,
//                             child: Image.asset(
//                               product?['imageUrl'],
//                               fit: BoxFit.fill,
//                             ),
//                           ),
//                           SizedBox(width: 12),
//                           // Product Details
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   item['name'],
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                                 SizedBox(height: 4),
//                                 Text(
//                                   "₹${item['price']}",
//                                   style: TextStyle(
//                                     color: Colors.grey[700],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           // Quantity Controls
//                           Row(
//                             children: [
//                               // Decrease quantity button
//                               Container(
//                                 height: 35,
//                                 width: 40,
//                                 decoration: BoxDecoration(border: Border.all()),
//                                 child: TextButton(
//                                   onPressed: () {
//                                     plusProvider.decrement();
//                                     // Don't allow quantity to go below 1
//                                     if (itemsCountInCart == 1) {
//                                       // If quantity would reach 0, show dialog confirming removal
//                                       showDialog(
//                                         context: context,
//                                         builder: (context) => AlertDialog(
//                                           title: Text('Remove Item'),
//                                           content: Text(
//                                               'Remove ${item['name']} from cart?'),
//                                           actions: [
//                                             TextButton(
//                                               onPressed: () =>
//                                                   Navigator.pop(context),
//                                               child: Text('Cancel'),
//                                             ),
//                                             TextButton(
//                                               onPressed: () {
//                                                 Navigator.pop(context);
//                                               },
//                                               child: Text('Remove'),
//                                             ),
//                                           ],
//                                         ),
//                                       );
//                                     }
//                                   },
//                                   style: TextButton.styleFrom(
//                                     padding: EdgeInsets.zero,
//                                     minimumSize: Size(30, 30),
//                                   ),
//                                   child: const Icon(Icons.remove, size: 18),
//                                 ),
//                               ),
//                               // Quantity display
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 10),
//                                 child: Text(
//                                   "${itemsCountInCart}",
//                                   style: TextStyle(fontSize: 16),
//                                 ),
//                               ),
//                               // Increase quantity button
//                               Container(
//                                 height: 35,
//                                 width: 40,
//                                 decoration: BoxDecoration(border: Border.all()),
//                                 child: TextButton(
//                                   onPressed: () {
//                                     plusProvider.increment();
//                                   },
//                                   style: TextButton.styleFrom(
//                                     padding: EdgeInsets.zero,
//                                     minimumSize: Size(30, 30),
//                                   ),
//                                   child: const Icon(Icons.add, size: 18),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(width: 10),
//                           // Total price
//                           Text(
//                             "₹${item['price'] * itemsCountInCart}",
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//       bottomNavigationBar: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(
//             padding: EdgeInsets.all(16),
//             child: Text(
//               "Total Amount : ₹${product?['price'] * itemsCountInCart}",
//               style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
//             ),
//           ),
//           SizedBox(
//             width: 370,
//             height: 70,
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.green,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               onPressed: () {
//                 cartProvider.addToCart({
//                   "id": productId,
//                   "name": product?['name'],
//                   "price": product?['price'],
//                   "quantity": itemsCountInCart, // Use selected quantity
//                   "imageUrl": product?['imageUrl']
//                 });
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => Checkoutscreen()),
//                 );
//               },
//               child: Text(
//                 "Checkout",
//                 style: TextStyle(fontSize: 20, color: Colors.white),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 25,
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:kisan_saathi/providerModels/cartProvider.dart';
import 'package:kisan_saathi/providerModels/prodcut/productTileProvider.dart';
import 'package:kisan_saathi/screens/user/cart/checkoutScree.dart';
import 'package:provider/provider.dart';

class cartScreen extends StatelessWidget {
  final String productId;
  const cartScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar:
          AppBar(backgroundColor: Colors.grey[200], title: Text("Your Cart")),
      body: cartProvider.cartItems.isEmpty
          ? Center(child: Text('Your cart is empty'))
          : ListView.builder(
              itemCount: cartProvider.cartItems.length,
              itemBuilder: (context, index) {
                final item = cartProvider.cartItems[index];
                return Dismissible(
                  key: Key(item['id'].toString()),
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    // Remove the item from the cart
                    cartProvider.removeFromCart(item['id']);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${item['name']} removed from cart'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  child: Card(
                    margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          // Product Image
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: Image.asset(
                              item['imageUrl'] ?? '',
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(width: 12),
                          // Product Details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['name'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "₹${item['price']}",
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Quantity Controls
                          Row(
                            children: [
                              // Decrease quantity button
                              Container(
                                height: 35,
                                width: 40,
                                decoration: BoxDecoration(border: Border.all()),
                                child: TextButton(
                                  onPressed: () {
                                    if (item['quantity'] > 1) {
                                      cartProvider.updateQuantity(
                                          item['id'], item['quantity'] - 1);
                                    } else {
                                      // If quantity would reach 0, show dialog confirming removal
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: Text('Remove Item'),
                                          content: Text(
                                              'Remove ${item['name']} from cart?'),
                                          actions: [
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: Text('Cancel'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                cartProvider
                                                    .removeFromCart(item['id']);
                                              },
                                              child: Text('Remove'),
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    minimumSize: Size(30, 30),
                                  ),
                                  child: const Icon(Icons.remove, size: 18),
                                ),
                              ),
                              // Quantity display
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  "${item['quantity']}",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              // Increase quantity button
                              Container(
                                height: 35,
                                width: 40,
                                decoration: BoxDecoration(border: Border.all()),
                                child: TextButton(
                                  onPressed: () {
                                    cartProvider.updateQuantity(
                                        item['id'], item['quantity'] + 1);
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    minimumSize: Size(30, 30),
                                  ),
                                  child: const Icon(Icons.add, size: 18),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 10),
                          // Total price
                          Text(
                            "₹${(item['price'] * item['quantity']).toStringAsFixed(2)}",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
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
              "Total Amount : ₹${cartProvider.calculateTotal().toStringAsFixed(2)}",
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

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kisan_saathi/providerModels/cartProvider.dart';
import 'package:kisan_saathi/providerModels/checkout/checkoutProvider.dart';
import 'package:kisan_saathi/screens/user/notification/notificationScreen.dart';
import 'package:kisan_saathi/utils/appbar.dart';
import 'package:provider/provider.dart';

class Finalbilling extends StatelessWidget {
  final List<int> Prices;
  const Finalbilling({super.key, required this.Prices});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cartProvider = Provider.of<CartProvider>(context);
    final checkoutProvider = Provider.of<Checkoutprovider>(context);

    final shipping_address = checkoutProvider.address_controller.text;
    final double totalPrice = Prices.fold(0, (sum, price) => sum + price);
    double subtotal = totalPrice; // Your existing total price
    double gst = subtotal * 0.18; // 18% GST
    double deliveryCharges =
        subtotal > 500 ? 0 : 50; // Free delivery above ₹500
    double grandTotal = subtotal + gst + deliveryCharges;

    return Scaffold(
      appBar: CustomAppBar(title: "Place Order"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container showing order details
            Container(
              margin: const EdgeInsets.only(left: 20),
              width: screenWidth * 0.9,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey[300],
              ),
              child: Column(
                children: [
                  const Text(
                    " Order Details ",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: cartProvider.cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartProvider.cartItems[index];
                      return ListTile(
                        title: Text(item['name']),
                        subtitle:
                            Text("₹${item['price']} x ${item['quantity']}"),
                        trailing: Text("₹${item['price'] * item['quantity']}"),
                      );
                    },
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 20,
            ),
            // Container showing final address
            Container(
              margin: const EdgeInsets.only(left: 20),
              width: screenWidth * 0.9,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey[300],
              ),
              child: Column(
                children: [
                  const Text(
                    " Shipping Address",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 23,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        "$shipping_address , Lorem ispum Lorem ispum Lorem ispum Lorem ispum Lorem ispum Lorem ispum Lorem ispum Lorem ispum Lorem ispum Lorem ispum "),
                  ), // Displaying the address here
                ],
              ),
            ),
            const SizedBox(
              height: 23,
            ),
            // Container(
            //   margin: const EdgeInsets.only(left: 20),
            //   width: screenWidth * 0.9,
            //   decoration: BoxDecoration(
            //     border: Border.all(color: Colors.black),
            //     borderRadius: BorderRadius.circular(30),
            //     color: Colors.grey[300],
            //   ),
            //   child: Column(
            //     children: [
            //       const Text(
            //         " Total Bill ",
            //         style: TextStyle(fontWeight: FontWeight.w600),
            //       ),
            //       const SizedBox(
            //         height: 17,
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Column(
            //           children: [
            //             Text("₹${totalPrice.toStringAsFixed(2)} "),
            //             Text("")
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              width: screenWidth * 0.9,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey[300],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "Total Bill",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                  const Divider(color: Colors.black),

                  // Billing Details Section
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildBillRow("Subtotal", subtotal, isBold: true),
                        _buildBillRow("GST (18%)", gst),
                        _buildBillRow("Delivery Charges", deliveryCharges),
                        const Divider(thickness: 1.5),
                        _buildBillRow("Grand Total", grandTotal, isBold: true),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50.0, top: 20),
              child: ElevatedButton(
                onPressed: () async {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Order placed successfully '),
                      backgroundColor: Colors.blueAccent,
                      duration: Duration(seconds: 3),
                    ),
                  );
                  await Future.delayed(Duration(seconds: 4));
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Notificationscreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(290, 60),
                ),
                child: Text("Place Order",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildBillRow(String label, double amount, {bool isBold = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          "₹${amount.toStringAsFixed(2)}",
          style: TextStyle(
            fontSize: 16,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    ),
  );
}

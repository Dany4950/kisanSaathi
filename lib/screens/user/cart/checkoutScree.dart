// import 'package:flutter/material.dart';
// import 'package:kisan_saathi/providerModels/cartProvider.dart';
// import 'package:kisan_saathi/providerModels/checkout/checkoutProvider.dart';

// import 'package:kisan_saathi/utils/appbar.dart';
// import 'package:kisan_saathi/utils/widgets/dropdownPaymentButton.dart';
// import 'package:provider/provider.dart';

// class Checkoutscreen extends StatefulWidget {
//   Checkoutscreen({super.key});

//   @override
//   State<Checkoutscreen> createState() => _CheckoutscreenState();
// }

// class _CheckoutscreenState extends State<Checkoutscreen> {
//   final _formKey = GlobalKey<FormState>();
//   // Form Key for validation
//   @override
//   Widget build(BuildContext context) {
//     final checkoutProvider = Provider.of<Checkoutprovider>(context);
//     final cartProvider = Provider.of<CartProvider>(context);
//     double screenWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       appBar: CustomAppBar(title: "CheckOut"),
//       body: SingleChildScrollView(
//         child: Form(
//           key: _formKey, // Attach Form Key
//           child: Column(
//             children: [
//               SizedBox(height: 30),

//               // Name
//               Padding(
//                 padding: const EdgeInsets.only(left: 35.0),
//                 child: Container(
//                   width: screenWidth * 0.8,
//                   child: TextFormField(
//                     controller: checkoutProvider.name_controller,
//                     maxLength: 10,
//                     style: const TextStyle(fontSize: 18, color: Colors.black),
//                     keyboardAppearance: Brightness.light,
//                     validator: checkoutProvider.validateName,
//                     decoration: const InputDecoration(hintText: "Enter Name"),
//                   ),
//                 ),
//               ),

//               // Email
//               Padding(
//                 padding: const EdgeInsets.only(left: 35.0),
//                 child: Container(
//                   width: screenWidth * 0.8,
//                   child: TextFormField(
//                     controller: checkoutProvider.email_controller,
//                     keyboardType: TextInputType.emailAddress,
//                     maxLength: 100,
//                     style: const TextStyle(fontSize: 18, color: Colors.black),
//                     keyboardAppearance: Brightness.light,
//                     validator: checkoutProvider.validateEmail,
//                     decoration: const InputDecoration(hintText: "Enter Email "),
//                   ),
//                 ),
//               ),

//               // Address
//               Padding(
//                 padding: const EdgeInsets.only(left: 35.0),
//                 child: Container(
//                   width: screenWidth * 0.8,
//                   child: TextFormField(
//                     controller: checkoutProvider.address_controller,
//                     maxLength: 100,
//                     style: const TextStyle(fontSize: 18, color: Colors.black),
//                     keyboardAppearance: Brightness.light,
//                     validator: checkoutProvider.validateAddress,
//                     decoration: const InputDecoration(
//                         hintText: "Enter Current Address"),
//                   ),
//                 ),
//               ),

//               // Phone Number
//               Padding(
//                 padding: const EdgeInsets.only(left: 35.0),
//                 child: Container(
//                   width: screenWidth * 0.8,
//                   child: TextFormField(
//                     controller: checkoutProvider.phone_controller,
//                     maxLength: 10,
//                     style: const TextStyle(fontSize: 18, color: Colors.black),
//                     keyboardType: TextInputType.phone,
//                     keyboardAppearance: Brightness.light,
//                     validator: checkoutProvider.validatePhone,
//                     decoration: const InputDecoration(
//                       hintText: "Enter Phone Number",
//                       counterText: "", // Hides maxLength counter
//                     ),
//                   ),
//                 ),
//               ),

//               SizedBox(height: 100),

//               const Padding(
//                 padding: EdgeInsets.only(right: 180.0),
//                 child: Text("Payment Method"),
//               ),

//               const Padding(
//                 padding: EdgeInsets.only(left: 33.0),
//                 child: SizedBox(
//                   width: 350,
//                   child: Divider(
//                     color: Colors.grey,
//                     thickness: 2,
//                   ),
//                 ),
//               ),

//               //payment methods
//               const DropdownPaymentButton(),

//               //   width: 400,
//               //   height: 80,
//               //   child: ElevatedButton(
//               //     style: ElevatedButton.styleFrom(
//               //       backgroundColor: Apptheme.buttonGreenColor,
//               //       shape: RoundedRectangleBorder(
//               //         borderRadius:
//               //             BorderRadius.circular(10), // Optional rounded corners
//               //       ),
//               //     ),
//               //     onPressed: () {},
//               //     child: const Text(
//               //       "Add to Cart ",
//               //       style: TextStyle(fontSize: 24, color: Colors.white),
//               //     ),
//               //   ),
//               // ),

//               Padding(
//                 padding: const EdgeInsets.only(left: 35.0),
//                 child: ElevatedButton(
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       // All fields are valid, proceed further
//                       print("Form Submitted Successfully");
//                       ListView.builder(
//                         itemCount: cartProvider.cartItems.length,
//                         itemBuilder: (context, index) {
//                           final item = cartProvider.cartItems[index];
//                           return ListTile(
//                             title: Text(item['name']),
//                             subtitle:
//                                 Text("₹${item['price']} x ${item['quantity']}"),
//                             trailing:
//                                 Text("₹${item['price'] * item['quantity']}"),
//                           );
//                         },
//                       );
//                     } else {
//                       print("Validation Failed");
//                     }
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.grey[600],
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     minimumSize: Size(300, 50),
//                   ),
//                   child: Text("Save",
//                       style: TextStyle(fontSize: 20, color: Colors.white)),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:kisan_saathi/providerModels/cartProvider.dart';
import 'package:kisan_saathi/providerModels/checkout/checkoutProvider.dart';
import 'package:kisan_saathi/themes/appTheme.dart';
import 'package:kisan_saathi/utils/appbar.dart';
import 'package:kisan_saathi/utils/loginElevatedButton.dart';
import 'package:kisan_saathi/utils/widgets/dropdownPaymentButton.dart';
import 'package:provider/provider.dart';

class Checkoutscreen extends StatefulWidget {
  Checkoutscreen({super.key});

  @override
  State<Checkoutscreen> createState() => _CheckoutscreenState();
}

class _CheckoutscreenState extends State<Checkoutscreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isFormSubmitted = false; // Track form submission

  @override
  Widget build(BuildContext context) {
    final checkoutProvider = Provider.of<Checkoutprovider>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppBar(title: "CheckOut"),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey, // Attach Form Key
          child: Column(
            children: [
              SizedBox(height: 30),

              // Name Field
              _buildTextField(
                  controller: checkoutProvider.name_controller,
                  validator: checkoutProvider.validateName,
                  hint: "Enter Name",
                  maxLength: 10),

              // Email Field
              _buildTextField(
                  controller: checkoutProvider.email_controller,
                  validator: checkoutProvider.validateEmail,
                  hint: "Enter Email",
                  maxLength: 100,
                  keyboardType: TextInputType.emailAddress),

              // Address Field
              _buildTextField(
                  controller: checkoutProvider.address_controller,
                  validator: checkoutProvider.validateAddress,
                  hint: "Enter Current Address",
                  maxLength: 100),

              // Phone Field
              _buildTextField(
                  controller: checkoutProvider.phone_controller,
                  validator: checkoutProvider.validatePhone,
                  hint: "Enter Phone Number",
                  maxLength: 10,
                  keyboardType: TextInputType.phone),

              SizedBox(height: 100),

              const Padding(
                padding: EdgeInsets.only(right: 180.0),
                child: Text("Payment Method"),
              ),

              const Padding(
                padding: EdgeInsets.only(left: 33.0),
                child: SizedBox(
                  width: 350,
                  child: Divider(
                    color: Colors.grey,
                    thickness: 2,
                  ),
                ),
              ),

              // Payment Methods Dropdown
              const DropdownPaymentButton(),

              SizedBox(height: 20),

              // Submit Button
              Padding(
                padding: const EdgeInsets.only(left: 35.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        _isFormSubmitted =
                            true; // Update the state to show the list
                      });
                      print("Form Submitted Successfully");
                    } else {
                      print("Validation Failed");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[600],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: Size(300, 50),
                  ),
                  child: Text("Save",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),

              SizedBox(height: 20),

              // Display list only after form submission
              if (_isFormSubmitted)
                Column(
                  children: [
                    SizedBox(
                      height: 200, // Set height to avoid rendering issues
                      child: ListView.builder(
                        itemCount: cartProvider.cartItems.length,
                        itemBuilder: (context, index) {
                          final item = cartProvider.cartItems[index];
                          return ListTile(
                            title: Text(item['name']),
                            subtitle:
                                Text("₹${item['price']} x ${item['quantity']}"),
                            trailing:
                                Text("₹${item['price'] * item['quantity']}"),
                          );
                        },
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            _isFormSubmitted =
                                true; // Update the state to show the list
                          });
                          print("Form Submitted Successfully");
                        } else {
                          print("Validation Failed");
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[600],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: Size(300, 50),
                      ),
                      child: Text("Proceed Billing",
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  /// Helper method to create text fields
  Widget _buildTextField({
    required TextEditingController controller,
    required String? Function(String?) validator,
    required String hint,
    required int maxLength,
    TextInputType keyboardType = TextInputType.text,
  }) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 35.0),
      child: Container(
        width: screenWidth * 0.8,
        child: TextFormField(
          controller: controller,
          maxLength: maxLength,
          keyboardType: keyboardType,
          style: const TextStyle(fontSize: 18, color: Colors.black),
          keyboardAppearance: Brightness.light,
          validator: validator,
          decoration: InputDecoration(hintText: hint, counterText: ""),
        ),
      ),
    );
  }
}

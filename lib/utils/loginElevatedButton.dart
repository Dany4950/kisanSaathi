import 'package:flutter/material.dart';

import 'package:kisan_saathi/screens/auth/Otp.dart';

class CustomelevatedLoginbutton extends StatelessWidget {
  const CustomelevatedLoginbutton({super.key});

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return TextButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => OtpScreen()));
      },
      child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[600], borderRadius: BorderRadius.circular(9)),
          height: screenHeight * 0.07,
          width: screenWidth * 0.7,
          child: const Center(
              child: Text(
            "Login/Register",
            style: TextStyle(fontSize: 16, color: Colors.white),
          ))),
    );
  }
}

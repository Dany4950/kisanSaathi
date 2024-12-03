

import 'package:flutter/material.dart';
import 'package:kisan_saathi/themes/appTheme.dart';
import 'package:kisan_saathi/utils/loginElevatedButton.dart';

class landingPage extends StatelessWidget {
  const landingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // starting of the column space
          SizedBox(
            height: screenHeight * 0.1,
          ),

          //logo container

          Center(
            child: Container(
              height: screenHeight * 0.25,
              child: Image.asset('assets/images/appLogo.png'),
            ),
          ),

          // space between app logo and app text
          SizedBox(
            height: screenHeight * 0.08,
          ),

//app name
          Text(
            "KISAN SAATHI",
            style: Apptheme.theme.textTheme.bodyLarge,
          ),
          // space between Main text and sub text
          SizedBox(
            height: screenHeight * 0.04,
          ),

          // sub text

          const Text("Your Ultimate Destination  for Spare Parts:"),
          const Text("Streamlined Services & Fast Delivery at your"),
          const Text("FingerTips"),

          // space between sub text and login button
          SizedBox(
            height: screenHeight * 0.04,
          ),
          // Login Button
          const CustomelevatedLoginbutton(),

          // space between button and Not now link
          SizedBox(
            height: screenHeight * 0.02,
          ),
          TextButton(
              onPressed: () {},
              child: const Text(
                "Not now ",
                style: TextStyle(decoration: TextDecoration.underline),
              )),
        ],
      ),
    );
  }
}

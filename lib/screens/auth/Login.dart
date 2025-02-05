

import 'package:flutter/material.dart';
import 'package:kisan_saathi/providerModels/login/mobileTextProvider.dart';

import 'package:kisan_saathi/screens/user/landingScreen.dart';
import 'package:kisan_saathi/themes/appTheme.dart';

import 'package:provider/provider.dart';


class loginScreen extends StatelessWidget {
  const loginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MobileProvider = Provider.of<Mobiletextprovider>(context);

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
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

          
            Center(
              child: Text(
                "KISAN SAATHI",
                style: Apptheme.theme.textTheme.bodyLarge,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.049,
            ),
            const Text("Your Premier Destination  for Lush  Greenary:"),
            const Text("Elevate your space with our execptional plant"),
            const Text("selection"),

            Container(
              width: screenWidth * 0.8,
              child: TextFormField(
                maxLength: 10,
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.normal),
                key: GlobalKey(),
                keyboardType: TextInputType.number,
                keyboardAppearance: Brightness.light,
                validator: (value) {
                  // login should be written from backend
                },
                controller: MobileProvider.MobileTextController,
                decoration: const InputDecoration(),
              ),
            ),

            // login/register button
            
           TextButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => landingScreen()));
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
    ),

            // space between button and Not now link
            SizedBox(
              height: screenHeight * 0.02,
            ),

            //not now text button

            TextButton(
                onPressed: () {
                  //logic need to be written from provider
                },
                child: const Text(
                  "Not now ",
                  style: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.underline),
                )),
//gap between not now button and bottom caption
            SizedBox(
              height: screenHeight * 0.3,
            ),
            Text("By Signing in you will agree to our "),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Text(
                    "Terms  ",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Apptheme.theme.textTheme.bodyLarge?.color),
                  ),
                  onTap: () {
                    //clicking on terms
                  },
                ),
                Text("&  "),
                InkWell(
                  child: Text(
                    "Policy",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Apptheme.theme.textTheme.bodyLarge?.color),
                  ),
                  onTap: () {
                    //clicking on terms
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

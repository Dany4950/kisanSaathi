
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kisan_saathi/providerModels/login/otpTextProvider.dart';
import 'package:kisan_saathi/themes/appTheme.dart';
import 'package:kisan_saathi/utils/loginElevatedButton.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final otpProvider = Provider.of<Otptextprovider>(context);

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.1),

              // App Logo/Title
              Center(
                child: Text(
                  "KISAN SAATHI",
                  style: Apptheme.theme.textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: screenHeight * 0.03),

              // Taglines
              const Text(
                "Your Premier Destination for Lush Greenery:",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const Text(
                "Elevate your space with our exceptional plant selection",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: screenHeight * 0.05),

              // OTP Input Boxes
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  4,
                  (index) => SizedBox(
                    width: screenWidth * 0.15,
                    child: TextFormField(
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      keyboardType: TextInputType.number,
                      keyboardAppearance: Brightness.light,
                      onChanged: (value) {
                        if (value.length == 1 && index < 3) {
                          
                          FocusScope.of(context).nextFocus();
                        }
                        if (value.isEmpty && index > 0) {
                          // Move to the previous field on backspace
                          FocusScope.of(context).previousFocus();
                        }
                        // Store value in provider or other state management
                        otpProvider.updateOtpDigit(index, value);
                      },
                      decoration: InputDecoration(
                        counterText: "",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: const EdgeInsets.all(16),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),

              // Login/Register Button
              const CustomelevatedLoginbutton(),

              SizedBox(height: screenHeight * 0.02),

              // Not Now Button
              TextButton(
                onPressed: () {
                  // Logic for skipping OTP
                },
                child: const Text(
                  "Not Now",
                  style: TextStyle(
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.1),

              // Terms and Policy
              const Text("By signing in you agree to our"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: Text(
                      "Terms ",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Apptheme.theme.textTheme.bodyLarge?.color,
                      ),
                    ),
                    onTap: () {
                      // Navigate to Terms page
                    },
                  ),
                  const Text("& "),
                  InkWell(
                    child: Text(
                      "Policy",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Apptheme.theme.textTheme.bodyLarge?.color,
                      ),
                    ),
                    onTap: () {
                      // Navigate to Policy page
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

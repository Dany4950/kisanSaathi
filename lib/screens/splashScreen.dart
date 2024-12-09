import 'package:flutter/material.dart';
import 'package:kisan_saathi/screens/auth/Login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    // Start animation after a small delay
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _visible = true;
      });
    });

    // Navigate to LandingPage after 6 seconds
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const loginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: const Duration(seconds: 6),
          curve: Curves.easeInOut,
          child: Image.asset(
            'assets/images/appLogo.png', // Replace with your image asset
            width: 200, // Adjust size as needed
            height: 200,
          ),
        ),
      ),
    );
  }
}


void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  ));
}


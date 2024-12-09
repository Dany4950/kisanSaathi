import 'package:flutter/material.dart';

class Navigationprovider extends ChangeNotifier {

void navigateToHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/home');  
    notifyListeners();  
  }
  
}
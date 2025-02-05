import 'package:flutter/material.dart';

class Checkoutprovider extends ChangeNotifier {
  TextEditingController name_controller = TextEditingController();

  TextEditingController phone_controller = TextEditingController();

  TextEditingController address_controller = TextEditingController();

  TextEditingController email_controller = TextEditingController();

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a phone number';
    }
    final phoneRegex =
        RegExp(r'^[0-9]{10}$'); // Allows only 10-digit phone numbers
    if (!phoneRegex.hasMatch(value)) {
      return 'Enter a valid 10-digit phone number';
    }
    return null;
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    final nameRegex =
        RegExp(r"^[a-zA-Z\s]+$"); // Allows only letters and spaces
    if (!nameRegex.hasMatch(value)) {
      return 'Name can only contain letters and spaces';
    }
    return null;
  }

  String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an address';
    }
    if (value.length < 5) {
      return 'Address must be at least 5 characters long';
    }
    return null;
  }
}

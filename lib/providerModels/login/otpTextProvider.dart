import 'package:flutter/material.dart';



class Otptextprovider with ChangeNotifier {
  final List<String> otpDigits = ["", "", "", ""];

  void updateOtpDigit(int index, String value) {
    otpDigits[index] = value;
    notifyListeners();
  }

  String getOtp() => otpDigits.join();
}

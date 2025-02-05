import 'package:flutter/material.dart';


class PaymentProvider extends ChangeNotifier {
  String? _selectedPaymentMethod;

  String? get selectedPaymentMethod => _selectedPaymentMethod;

  void setPaymentMethod(String? method) {
    _selectedPaymentMethod = method;
    notifyListeners(); // Notify UI to rebuild
  }
}

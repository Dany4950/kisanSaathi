import 'package:flutter/material.dart';


class AddtocartProvider extends ChangeNotifier {
  int _numberOfItems = 1; 


  int get numberOfItems => _numberOfItems;

  // Function to increment the number of items
  void increment() {
    _numberOfItems++; // Increment the count
    notifyListeners(); // Notify listeners to update the UI
  }

  // Function to decrement the number of items (optional)
  void decrement() {
    if (_numberOfItems > 0) {
      _numberOfItems--; // Decrement the count
      notifyListeners(); // Notify listeners to update the UI
    }
  }



}

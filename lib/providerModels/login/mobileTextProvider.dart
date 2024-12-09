import 'package:flutter/material.dart';

class Mobiletextprovider extends ChangeNotifier {
  TextEditingController MobileTextController = TextEditingController();


// logic of how the Mobile should be sent to sever and to next screen should be written
  final MobileKey = TextFormField(
    key: GlobalKey(),
  );
}

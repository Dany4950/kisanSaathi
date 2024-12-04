import 'package:flutter/material.dart';

class Mobiletextprovider extends ChangeNotifier {
  TextEditingController MobileTextController = TextEditingController();

  final MobileKey = TextFormField(
    key: GlobalKey(),
  );
}

import 'package:flutter/material.dart';
import 'package:kisan_saathi/utils/appbar.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: 'HomeScreen')
        ],
      ),
    );
  }
}
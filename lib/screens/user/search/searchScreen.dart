import 'package:flutter/material.dart';

import 'package:kisan_saathi/utils/appbar.dart';

class Searchscreen extends StatelessWidget {
  const Searchscreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: 'SEARCH'),

          //search bar
          Container(
            width: screenWidth * 0.8,
            child: TextFormField(
              maxLength: 100,
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.normal),
              key: GlobalKey(),
              keyboardType: TextInputType.text,
              keyboardAppearance: Brightness.light,
              validator: (value) {
                // login should be written from backend
              },
              decoration: InputDecoration(
                suffix: IconButton(
                    onPressed: () {
                      //logic for the voice button
                    },
                    icon: Icon(Icons.mic)),
                hintText: 'Search',
              ),
            ),
          )
        ],
      ),
    );
  }
}

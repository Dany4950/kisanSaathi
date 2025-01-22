import 'package:flutter/material.dart';
import 'package:kisan_saathi/utils/appbar.dart';

class EditInfoscreen extends StatelessWidget {
  const EditInfoscreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppBar(title: "Edit Profile "),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),

          // Intro Text
          Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 20),
            child: Container(
              height: 44,
              width: 330,
              child: Text(
                  "The information will be saved for the next purchase. Click on the details to edit."),
            ),
          ),
          SizedBox(
            height: 30,
          ),

          // Name Container
          Padding(
            padding: const EdgeInsets.only(left: 35.0),
            child: Container(
              width: screenWidth * 0.8,
              child: TextFormField(
                maxLength: 10,
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.normal),
                key: GlobalKey(),
                keyboardAppearance: Brightness.light,
                validator: (value) {
                  // login should be written from backend
                },
                decoration: const InputDecoration(),
              ),
            ),
          ),

          // gmail container ,
          Padding(
            padding: const EdgeInsets.only(left: 35.0),
            child: Container(
              width: screenWidth * 0.8,
              child: TextFormField(
                maxLength: 100,
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.normal),
                key: GlobalKey(),
                keyboardAppearance: Brightness.light,
                validator: (value) {
                  // login should be written from backend
                },
                decoration: const InputDecoration(),
              ),
            ),
          ),

          //Address
          Padding(
            padding: const EdgeInsets.only(left: 35.0),
            child: Container(
              width: screenWidth * 0.8,
              child: TextFormField(
                maxLength: 100,
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.normal),
                key: GlobalKey(),
                keyboardAppearance: Brightness.light,
                validator: (value) {
                  // login should be written from backend
                },
                decoration: const InputDecoration(),
              ),
            ),
          ),

          // Phone Number
          Padding(
            padding: const EdgeInsets.only(left: 35.0),
            child: Container(
              width: screenWidth * 0.8,
              child: TextFormField(
                maxLength: 10,
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.normal),
                key: GlobalKey(),
                keyboardType: TextInputType.number,
                keyboardAppearance: Brightness.light,
                validator: (value) {
                  // login should be written from backend
                },
                decoration: const InputDecoration(),
              ),
            ),
          ),

          SizedBox(
            height: 280,
          ),
          //Save button
          Padding(
            padding: const EdgeInsets.only(left: 35.0),
            child: TextButton(
                onPressed: () {
                  //logic on what to happen when Pressed on save button
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[600],
                      borderRadius: BorderRadius.circular(10)),
                  height: 50,
                  width: 300,
                  child: Center(
                      child: Text(
                    "Save",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
                )),
          )
        ],
      ),
    );
  }
}

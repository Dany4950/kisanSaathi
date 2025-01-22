import 'package:flutter/material.dart';
import 'package:kisan_saathi/screens/user/profile/screens/editInfoScreen.dart';
import 'package:kisan_saathi/themes/appTheme.dart';
import 'package:kisan_saathi/utils/appbar.dart';

class Profilescreen extends StatelessWidget {
  const Profilescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Profile"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // the main information of the user from db
          Padding(
            padding: EdgeInsets.only(top: 46.0, left: 50, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //profile photo
                CircleAvatar(
                  radius: 30,
                ),
                Column(
                  //name and number of the user
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 0),
                      child: Text(
                        "Lahari ",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 17),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text("+91 123123123"),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: 55.0, top: 10),
            child: Text(
              "General",
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
          ),
          Divider(
            endIndent: 45, indent: 45,
            thickness: 1.0, // Line thickness
            color: Colors.grey, // Line color
          ),

          // edit text button
          Padding(
            padding: const EdgeInsets.only(left: 43.0),
            child: TextButton(
              onPressed: () {
                //route navigation
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EditInfoscreen()));
              },
              child: Text(
                "Edit Information",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),

          //order history
          Padding(
            padding: const EdgeInsets.only(left: 43.0),
            child: TextButton(
              onPressed: () {
                //route navigation
              },
              child: Text(
                "Order History ",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),

          //service boy number
          Padding(
            padding: const EdgeInsets.only(left: 43.0),
            child: TextButton(
              onPressed: () {
                //route navigation
              },
              child: Text(
                "Service Boy Number",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),

          //help Center
          Padding(
            padding: const EdgeInsets.only(left: 43.0),
            child: TextButton(
              onPressed: () {
                //route navigation
              },
              child: Text(
                "Help Center",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),

          //FAQ's
          Padding(
            padding: const EdgeInsets.only(left: 43.0),
            child: TextButton(
              onPressed: () {
                //route navigation
              },
              child: Text(
                "FAQ's",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),

          //Terms and policy
          Padding(
            padding: const EdgeInsets.only(left: 43.0),
            child: TextButton(
              onPressed: () {
                //route navigation
              },
              child: Text(
                "Terms and policy ",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          //security policy

          Padding(
            padding: const EdgeInsets.only(left: 43.0),
            child: TextButton(
              onPressed: () {
                //route navigation
              },
              child: Text(
                "Security Policy ",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          //Logout button
          Padding(
            padding: const EdgeInsets.only(left: 43.0),
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Logout",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

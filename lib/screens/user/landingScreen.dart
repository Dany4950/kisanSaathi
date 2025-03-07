import 'package:flutter/material.dart';
import 'package:kisan_saathi/screens/user/homepage/HomeScreen.dart';
import 'package:kisan_saathi/screens/user/navigation/navigation.dart';
import 'package:kisan_saathi/screens/user/navigation/navigationItem.dart';
import 'package:kisan_saathi/screens/user/notification/notificationScreen.dart';
import 'package:kisan_saathi/screens/user/profile/profileScreen.dart';
import 'package:kisan_saathi/screens/user/search/searchScreen.dart';

// this screen pops up after login , handles navigation of pages on index based stack

class landingScreen extends StatelessWidget {
  landingScreen({Key? key}) : super(key: key);

  final List<NavigationItem> _navigationItems = [
    NavigationItem(
      label: '',
      icon: Icons.home  ,
      
      screen: Homescreen(),
    ),
    NavigationItem(
      label: '',
      icon: Icons.search,
      screen: SearchScreen(),
    ),
    NavigationItem(
        label: '',
        icon: Icons.notifications,
        screen: const Notificationscreen()),
    NavigationItem(
      label: '',
      icon: Icons.person,
      screen: const Profilescreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AppNavigator(items: _navigationItems);
  }
}


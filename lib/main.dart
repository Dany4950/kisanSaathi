import 'package:flutter/material.dart';
import 'package:kisan_saathi/providerModels/login/mobileTextProvider.dart';
import 'package:kisan_saathi/providerModels/login/otpTextProvider.dart';

import 'package:kisan_saathi/screens/splashScreen.dart';
import 'package:kisan_saathi/themes/appTheme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp((const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Mobiletextprovider>(
          create: (context) => Mobiletextprovider(),
        ),

        ChangeNotifierProvider<Otptextprovider>(
          create: (context) => Otptextprovider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Apptheme.theme,
        home: const SplashScreen(),
      ),
    );
  }
}

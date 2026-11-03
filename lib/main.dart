import 'package:flutter/material.dart';

import 'pages/home.dart';
import 'pages/about.dart';
import 'pages/contact.dart';
import 'pages/facebook.dart';

// import 'pages/twitter.dart';
// import 'pages/vpizza.dart';
// import 'pages/fries.dart';
//uncomment the above imports if you want to use them in your app

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(),
      routes: {
        '0': (context) => ContactPage(),
        '1': (context) => AboutPage(),
        '2': (context) => FacebookPage(),
        // '3': (context) => Twitter(),
        // '4': (context) => Facebook(),
        //uncomment the above routes if you want to use them in your app
      },
    );
  }
}

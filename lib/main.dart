import 'package:flutter/material.dart';

import 'pages/home.dart';
import 'pages/about.dart';
import 'pages/contact.dart';
import 'pages/menu.dart';
import 'pages/facebook.dart';
import 'pages/twitter.dart';

// import 'pages/vpizza.dart';
// import 'pages/chpizza.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'WOW Pizza',
      home: const Home(),
      routes: {
        '0': (context) => ContactPage(),
        '1': (context) => AboutPage(),
        '2': (context) => FacebookPage(),
        '4': (context) => MenuPage(),
        '3': (context) => TwitterPage(),
      },
    );
  }
}

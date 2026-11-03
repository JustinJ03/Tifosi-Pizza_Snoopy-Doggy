import 'package:flutter/material.dart';

import 'pages/home.dart';
import 'pages/facebook.dart';

// import 'chpizza.dart';
// import 'twitter.dart';
// import 'vpizza.dart';
// import 'fries.dart';
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
        // '0': (context) => Vpizza(),
        // '1': (context) => Chpizza(),
        // '2': (context) => Fries(),
        // '3': (context) => Twitter(),
        '/facebook': (context) => const FacebookPage(),
        //uncomment the above routes if you want to use them in your app
      },
    );
  }
}

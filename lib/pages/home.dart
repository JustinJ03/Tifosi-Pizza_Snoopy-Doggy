import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Row(
          children: [
            Text(
              'WOW Pizza',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 160.0),
            Image.asset(
              'assets/images/twitter.jpg',
              fit: BoxFit.contain,
              height: 30,
            ),
            SizedBox(width: 10.0),
            Image.asset(
              'assets/images/facebook.png',
              fit: BoxFit.contain,
              height: 60,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Horizontal scrollable row for buttons
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: const StadiumBorder(),
                      side: const BorderSide(color: Colors.red),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '0');
                    },
                    child: const Text(
                      'Vegetable Pizza',
                      style: TextStyle(fontSize: 20.0, color: Colors.orange),
                    ),
                  ),
                  const SizedBox(width: 10), // Spacing between buttons
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: const StadiumBorder(),
                      side: const BorderSide(color: Colors.red),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '1');
                    },
                    child: const Text(
                      'Cheese Pizza',
                      style: TextStyle(fontSize: 20.0, color: Colors.orange),
                    ),
                  ),
                  const SizedBox(width: 10),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: const StadiumBorder(),
                      side: const BorderSide(color: Colors.red),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '2');
                    },
                    child: const Text(
                      'Fries',
                      style: TextStyle(fontSize: 20.0, color: Colors.orange),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Centered column for image and description text
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/pizza.jpg',
                    height: 400.0,
                    width: 400.0,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Hi, I'm the Pizza Assistant, what can I help you order?",
                    style: TextStyle(fontSize: 24.0),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

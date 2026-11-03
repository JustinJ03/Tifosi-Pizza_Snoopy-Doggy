import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Menu'),
        backgroundColor: Colors.deepOrange,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'WOW Pizza Menu',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            const Text('1. Vegetarian Pizza - RM15'),
            const Text('2. Chicken Pizza - RM18'),
            const Text('3. French Fries - RM8'),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}

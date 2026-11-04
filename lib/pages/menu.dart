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

      body: Padding(
        padding: const EdgeInsets.all(16.0),

        child: Column(
          children: [
            const Text(
              'WOW Pizza Menu',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView(
                children: [
                  menuItem(
                    'Vegetarian Pizza',
                    'RM15',
                    'https://images.unsplash.com/photo-1579751626657-72bc17010498?w=500',
                  ),

                  menuItem(
                    'Chicken Pizza',
                    'RM18',
                    'https://images.unsplash.com/photo-1513104890138-7c749659a591?w=500',
                  ),

                  menuItem(
                    'French Fries',
                    'RM8',
                    'https://images.unsplash.com/photo-1573080496219-bb080dd4f877?w=500',
                  ),
                ],
              ),
            ),

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

  Widget menuItem(String name, String price, String imageUrl) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            height: 180,
            width: double.infinity,
            fit: BoxFit.cover,

            errorBuilder: (context, error, stackTrace) {
              return const SizedBox(
                height: 180,
                child: Center(child: Icon(Icons.broken_image, size: 50)),
              );
            },
          ),

          Padding(
            padding: const EdgeInsets.all(12.0),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

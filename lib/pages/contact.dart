import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepOrange,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.phone, color: Colors.deepOrange),
                        title: Text('Phone'),
                        subtitle: Text('012-345 6789'),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.email, color: Colors.deepOrange),
                        title: Text('Email'),
                        subtitle: Text('contact@wowpizza.com'),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(
                          Icons.location_on,
                          color: Colors.deepOrange,
                        ),
                        title: Text('Address'),
                        subtitle: Text(
                          'WOW Pizza, UNIMAS, 94300 Kota Samarahan, Sarawak.',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

typedef Contact = ContactPage;

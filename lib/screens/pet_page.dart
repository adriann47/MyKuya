import 'package:flutter/material.dart';

// Pet Sitting screen
class PetPage extends StatelessWidget {
  const PetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar
      appBar: AppBar(
        title: Text('Pet Sitting'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      // Placeholder content
      body: Center(
        child: Text('Coming soon...'),
      ),
    );
  }
}

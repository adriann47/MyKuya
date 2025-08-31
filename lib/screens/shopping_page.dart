import 'package:flutter/material.dart';

// Shopping Page
class ShoppingPage extends StatelessWidget {
  const ShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar
      appBar: AppBar(
        title: Text('Shopping'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,

      // Placeholder content
      body: Center(
        child: Text('Coming Soon...'),
      ),
    );
  }
}

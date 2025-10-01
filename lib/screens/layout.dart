import 'package:flutter/material.dart';
import 'package:mykuya/screens/home_page.dart';
import 'package:mykuya/screens/notifications.dart';
import 'package:mykuya/screens/wallet.dart';

// Main layout widget with bottom navigation
class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  // Keeps track of the current screen index
  int _currentScreen = 0;

  // Updates the screen when a navigation item is tapped
  void _screenNavigator(int index) {
    setState(() {
      _currentScreen = index;
    });
  }

  // List of screens for navigation
  final List _screens = [
    HomePage(),
    Notifications(),
    Wallet(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // Displays the current screen
      body: _screens[_currentScreen],

      // Bottom navigation bar
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: const Color.fromRGBO(207, 216, 220, 1),
              width: .5,
            ),
          ),
        ),

        child: BottomNavigationBar(
          unselectedItemColor: const Color.fromRGBO(207, 216, 220, 1),
          selectedItemColor: Colors.grey[900],
          backgroundColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _currentScreen,
          onTap: _screenNavigator,
          items: [
            // Home item
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Color(0xFF55A2F0)),
              label: 'Home',
            ),

            // Notifications item
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications, color: Color(0xFF55A2F0)),
              label: 'Notifications',
            ),

            // Wallet item
            BottomNavigationBarItem(
              icon: Icon(Icons.wallet, color: Color(0xFF55A2F0)),
              label: 'Wallet',
            ),
          ],
        ),
      ),
    );
  }
}

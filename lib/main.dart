import 'package:flutter/material.dart';
import 'package:mykuya/firebase_options.dart';
import 'package:mykuya/screens/cleaning_page.dart';
import 'package:mykuya/screens/delivery_page.dart';
import 'package:mykuya/screens/layout.dart';
import 'package:mykuya/screens/pet_page.dart';
import 'package:mykuya/screens/shopping_page.dart';
import 'package:mykuya/screens/login.dart';
import 'package:mykuya/screens/register.dart';
import 'package:firebase_core/firebase_core.dart';


Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/delivery' : (context) => DeliveryPage(),
        '/shopping' : (context) => ShoppingPage(),
        '/cleaning' : (context) => CleaningPage(),
        '/pet' : (context) => PetPage()
      },
      home: Layout(),
    );
  }
}


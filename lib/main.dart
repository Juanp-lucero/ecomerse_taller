import 'package:flutter/material.dart';
import 'models/cart.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Cart cart = Cart();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ECommerce',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: HomePage(cart: cart),
    );
  }
}

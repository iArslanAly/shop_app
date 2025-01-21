import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/cart_provider.dart';

import 'package:shop_app/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            inputDecorationTheme: InputDecorationTheme(
              hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            textTheme: TextTheme(
              titleMedium: TextStyle(
                fontFamily: 'Lato',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.5,
              ),
              titleLarge: TextStyle(
                fontFamily: 'Lato',
                fontWeight: FontWeight.bold,
                letterSpacing: -0.5,
                fontSize: 24,
              ),
              bodySmall: TextStyle(
                fontSize: 16,
                fontFamily: 'Lato',
                fontWeight: FontWeight.bold,
              ),
            ),
            colorScheme: ColorScheme.fromSeed(
                seedColor: Color.fromARGB(255, 25, 185, 137)),
          ),
          title: 'Shopping App',
          home: HomePage()),
    );
  }
}

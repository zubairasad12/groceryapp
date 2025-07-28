import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // ✅ provider import
import 'package:groceryshopbymitchkoko/model/cart_model.dart'; // ✅ your model
import 'package:groceryshopbymitchkoko/pages/intro_page.dart'; // ✅ your intro page

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(), // ✅ provider setup
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: IntroPage(), // ✅ starting screen
      ),
    );
  }
}

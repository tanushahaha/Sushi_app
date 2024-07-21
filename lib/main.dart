import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:sushi_app/pages/cart.dart';
import 'pages/intro_page.dart';
import 'pages/menu_page.dart';
import 'package:provider/provider.dart';
import 'package:sushi_app/pages/shop.dart';
import 'package:sushi_app/pages/login.dart';
import 'package:http/http.dart' as http;



void main() {
  Stripe.publishableKey = 'pk_test_51PbiwyRvVJCwWLRJ6Hl9ZkuSTXm8acCJZUVf12XeNciS7v98nU5zmL5b3PZEH5uSHMeTDbUBSnRa45A20A2auCBP00gFzgpicH';
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
    child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp
      (
      debugShowCheckedModeBanner: false,
      home:const IntroPage(),
      routes: {
        '/intropage': (context) => const IntroPage(),
        '/menupage' : (context) => const MenuPage(),
        '/cartpage' : (context) => const CartPage(),
        '/loginpage': (context) => const LoginPage(),
      }
      );
  }
}



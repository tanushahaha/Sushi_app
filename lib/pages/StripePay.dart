import 'package:flutter/material.dart';
import 'package:sushi_app/themes/colors.dart';

class StripePage extends StatefulWidget {
  const StripePage({super.key});

  @override
  State<StripePage> createState() => _StripePageState();
}

class _StripePageState extends State<StripePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      backgroundColor: Colors.grey[300],
      appBar: AppBar
        (
        backgroundColor: primaryColor,
        title: const Text("Payment Gateway",
          style: TextStyle
            (
            fontSize: 24,
          ),),
      ),
    );
  }
}


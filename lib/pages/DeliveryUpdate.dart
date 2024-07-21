import 'package:flutter/material.dart';
import 'package:sushi_app/components/MyReceipt.dart';
import 'package:sushi_app/themes/colors.dart';

class DeliveryUpdate extends StatelessWidget {
  const DeliveryUpdate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      appBar: AppBar(
        title: Text("Delivery in Progress"),
      backgroundColor: primaryColor,
      ),
      body: Column
        (
        children: [
          MyReceipt(),
        ],
      ),
    );
  }
}


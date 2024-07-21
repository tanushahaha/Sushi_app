import 'package:flutter/material.dart';
import 'package:sushi_app/themes/colors.dart';

class MyReceipt extends StatelessWidget {
  const MyReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(left:25,right:25,bottom:25,top:50),
    child:Center
    (
      child: Column
      (
        mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Thankyou For Ordering With Us!"),
        const SizedBox(height: 25,),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: primaryColor),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(25),
          child: Text("Receipt here..."),
        ),
      ],
    ),
    ),
    );
  }
}

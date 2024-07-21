import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:sushi_app/components/button.dart';
import 'package:sushi_app/themes/colors.dart';

import 'DeliveryUpdate.dart';

class PaymentsPage extends StatefulWidget {
  const PaymentsPage({super.key});

  @override
  State<PaymentsPage> createState() => _PaymentsPageState();
}

class _PaymentsPageState extends State<PaymentsPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber ='';
  String expiryDate='';
  String cardHolderName='';
  String cvvCode='';
  bool isCvvFocused = false;

  //user wants to pay
  void userTappedPay()
  {
    if(formKey.currentState!.validate()){
      //only if valid
      showDialog(
          context: context,
          builder: (context)=> AlertDialog
            (
            title: const Text("Confirm Payment"),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text("Card Number : $cardNumber"),
                  Text("expiryDate : $expiryDate"),
                  Text(" Card Holder Name: $cardHolderName"),
                  Text("CVV : $cvvCode"),
                ],
              ),
            ),
            actions: [
              //Cancel Button
              TextButton(
                  onPressed: ()=> Navigator.pop(context),
                  child: const Text("Cancel"),
              ),

              //yes Button
              TextButton(
                onPressed: ()=> Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>DeliveryUpdate(),
                  ),
                ),
                child: const Text("Yes"),
              )
            ],
          ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      backgroundColor: Colors.grey[300],
      appBar: AppBar
        (
        backgroundColor: primaryColor,
        title: const Text("Checkout"),
      ),
        body: Column(
              children: [
                //credit card
                CreditCardWidget(
                    cardNumber: cardNumber,
                    expiryDate: expiryDate,
                    cardHolderName: cardHolderName,
                    cvvCode: cvvCode,
                    showBackView: isCvvFocused,
                    onCreditCardWidgetChange: (p0) {},
                ),
                CreditCardForm(cardNumber: cardNumber,
                    expiryDate: expiryDate,
                    cardHolderName: cardHolderName,
                    cvvCode: cvvCode,
                    onCreditCardModelChange: (data)
                    {
                      setState(() {
                        cardNumber = data.cardNumber;
                        expiryDate =data.expiryDate;
                        cardHolderName =data.cardHolderName;
                        cvvCode =data.cvvCode;
                      });
                    },
                    formKey: formKey),
                const Spacer(),
                MyButton(
                    text: "Pay Securely",
                    onTap:userTappedPay,
                ),
                const SizedBox(height: 25,),

              ],
        ),
    );
  }
}

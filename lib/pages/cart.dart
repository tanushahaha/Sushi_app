import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_app/components/button.dart';
import 'package:sushi_app/pages/StripePay.dart';
import 'package:sushi_app/pages/payments.dart';
import 'package:sushi_app/themes/colors.dart';
import 'package:sushi_app/pages/shop.dart';
import 'food.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

//remove from cart
  void removeFromCart(Food food, BuildContext context)
  {
    //get access to the shop
    final shop = context.read<Shop>();
    
    //remove from cart
    shop.removeFromCart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context,value,child) => Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          title: const Text("My Cart"),
        elevation: 0,
        backgroundColor: primaryColor,
        ),
        body: Column(
          children: [
            //CUSTOMER CART
            Expanded(
              child: ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (context,index)
              {
                //get the food from the cart
              final Food food = value.cart[index];
                //get food name
                    final String foodName = food.Name;
                // get food price
              final String price = food.Price;
                // return list title
                return Container(
                  decoration: BoxDecoration(color: Colors.brown[700], borderRadius:BorderRadius.circular(8),
                  ),
                  margin: const EdgeInsets.only(left: 20,top:20, right:20),
                  child: ListTile(
                    title: Text(foodName,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(price,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete,
                      color: Colors.grey,
                      ),
                      onPressed: ()=> removeFromCart(food,context) ,
                    ),
                  ),
                );
              },
              ),
            ),

            //PAY BUTTON
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: MyButton(
                  text: "PAY NOW",
                  onTap:()=> Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context)=> const PaymentsPage(),
                  ),
                  ),
              ),

            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: MyButton(
                text: "Stripe",
                onTap:()=> Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context)=> const StripePage(),
                  ),
                ),
              ),

            ),
            const SizedBox(width: 20,),
          ],
        ),
      ),
    );
  }
}

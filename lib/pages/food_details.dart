import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi_app/components/button.dart';
import 'package:sushi_app/pages/shop.dart';
import 'package:sushi_app/themes/colors.dart';
import 'package:sushi_app/pages/food.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;
  const FoodDetailsPage({super.key, required this.food});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {

  //quantity
  int quantityCount =0;

  //decrementQuantity
  void decrementQuantity() {
    setState(() {
      if(quantityCount >0)
      {
        quantityCount--;
      }
    });
  }

  //increment quantity
  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  //addtocart
  void addtocart(){
    //only add to cart if there is something in the cart
      if(quantityCount >0)
       {
        //get access to the shop
        final shop = context.read<Shop>();

        //add to cart
        shop.addToCart(widget.food, quantityCount);

        //let the user know it was successful
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => AlertDialog(
              backgroundColor: primaryColor,
              content: const Text("Successfully Added to Cart",
                  style: TextStyle(
                    color: Colors.white),
                textAlign:TextAlign.center ,
              ),
              actions: [
                //okay button 
                IconButton(
                onPressed: () {
                  //pop once to remove dialog box
                  Navigator.pop(context);

                  //pop again to go to previous screen
                  Navigator.pop(context);
                },
                    icon: const Icon(Icons.done, color: Colors.white,),
                )
              ],
            ),
        );
      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar
        (
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
    body: Column(
      children: [
        //listview of food deets
      Expanded
        (
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:25.0,),
            child: ListView
                    (
              children: [
                //image
                  Image.asset
                    (
                    widget.food.Imagepath,
                    height: 200,
                  ),
                const SizedBox(width:25,),
                //rating
                Row
                  (
                  children: [
                    //star icon
                    Icon(Icons.star,
                    color: Colors.yellow[800],),
                    const SizedBox(height:10),
                    //rating number
                    Text(
                      widget.food.Rating,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.bold,
                      )
                    )
                  ],
                ),
                const SizedBox(width:25,),
                //name

                Text(
                    widget.food.Name,
                    style:GoogleFonts.dmSerifDisplay(fontSize: 28) ,
                ),
                const SizedBox(width:25,),

                //description
                Text
                  (
                    "Description",
                    style: TextStyle
                  (
                        color: Colors.grey[900],
                        fontWeight: FontWeight.bold,
                        fontSize:18,
                    ),
                    ),
                const SizedBox(height:10),
                Text("Bacon ipsum dolorball chuck alcatra brisket. Pork mi. Drumstick ribeye beef ribsok leberkas tbone,Hamburger spare ribs sirloin, strip steak biltong pork belly capicola cow drumstick turkey shoulder pig kielbasa bacon. Boudin picanha kielbasa burgdoggen, venison cupim salami biltong fatback chuck ham. Pig bresaola spare ribs alcatra. Ham frankfurter capicola bacon andouille bre. Andouille meatball chuck, buffalo burtrip steak",
                style:TextStyle
                  (
                  color: Colors.grey[600],
                  fontSize: 14,
                  height: 2,
                ),
                ),
              ],
            ),
          ),
      ),

        //proce quant add to cart
        Container(
          color: primaryColor,
          padding: const EdgeInsets.all(25),
          child: Column(children: [
            //price quant
            Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children: [
              //price
                Text(
                  "\$${widget.food.Price}",
                  style: const TextStyle(
                      color: Colors.white,
                  fontWeight:FontWeight.bold,
                  fontSize: 18,
                  ),
                ),

              //quantity
              Row(children: [
                //minus
                Container
                  (
                  decoration: BoxDecoration
                    (color: Color.fromARGB(138,54,55,100),
                  shape: BoxShape.circle,
                  ),
                  child: IconButton
                    (icon: const Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                   onPressed:decrementQuantity,
                  ),
                ),

                //count
                SizedBox(
                  width: 40,
                  child: Center(
                    child: Text
                      (quantityCount.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),

                //plus
                Container
                  (
                  decoration: BoxDecoration
                    (color: Color.fromARGB(138,54,55,100),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton
                    (icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                    onPressed:incrementQuantity,
                  ),
                ),

                //
              ],)

            ],
            ),
            const SizedBox(height: 25),
            //add to cart button

            MyButton(text:"Add To Cart", onTap:addtocart )
          ],),
        )
      ],
        ),

    );
  }
}

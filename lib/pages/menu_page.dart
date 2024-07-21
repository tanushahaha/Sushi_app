import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi_app/components/button.dart';
import 'package:sushi_app/pages/food.dart';
import 'package:sushi_app/pages/shop.dart';
import 'package:sushi_app/themes/colors.dart';
import '../components/food_tile.dart';
import 'package:sushi_app/pages/food_details.dart';


class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  void NavigateToDetails(int index)
  {
    //get the shop and menu
    final shop = context.read<Shop>();
    final FoodMenu =shop.FoodMenu;
    Navigator.push
      (context, MaterialPageRoute(builder: (context) => FoodDetailsPage(food: FoodMenu[index],),),);
  }
  @override
  Widget build(BuildContext context) {
    //get the shop and menu
    final shop = context.read<Shop>();
    final FoodMenu =shop.FoodMenu;
    return Scaffold
      (
      backgroundColor: Colors.grey[300],
    appBar: AppBar
      (
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.grey[800],
      elevation: 0,
      leading: Icon(Icons.menu),
      centerTitle: true,
      title: const Text("TOKYO"),
      actions: [
        //cart button
        IconButton(
            onPressed:()
            {
              Navigator.pushNamed(context, '/cartpage');
            },
            icon: const Icon(Icons.shopping_cart),
        ),
        IconButton(
          onPressed:()
          {
            Navigator.pushNamed(context, '/loginpage');
          },
          icon: const Icon(Icons.person_rounded),
        ),
      ],

    ),
      body: Column
        (
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

        //promobar
          Container
            (
            decoration: BoxDecoration (color: primaryColor, borderRadius:BorderRadius.circular(20)),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.symmetric(vertical:25, horizontal: 35),
            child: Row
              ( mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:
            [ Column
              (
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                //promo message
                 Text("Get 33% promo", style: GoogleFonts.dmSerifDisplay
                   (
                   fontSize: 20.0,
                   color: Colors.white,
                 ),),

                const SizedBox(height: 20.0),

                //Redeem Button
                MyButton(
                    text: "Redeem",
                    onTap: (){}
                )
              ],
            ),

          //image
              Image.asset('lib/images/sushi.png', height: 100,)

            ],

            ),
          ),
          const SizedBox(height: 20.0),

        //search banner
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
          child : TextField(
            decoration:
            InputDecoration
              (
              focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(20.0),
              ),
             enabledBorder: OutlineInputBorder(
               borderSide: BorderSide(color: Colors.white),
               borderRadius: BorderRadius.circular(20.0),
              ),
              hintText: "Search here...",
            ),
          )
          ),

        //menu list
          const SizedBox(height: 5.0),
         Padding(
             padding: EdgeInsets.symmetric(horizontal:20.0),
             child: Text("Food Menu", style: TextStyle
               (
               fontWeight: FontWeight.bold,
               fontSize: 18.0,
               color: Colors.grey[800],
             ),),
         ),

          const SizedBox(height: 5.0),
        Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
              itemCount: FoodMenu.length,
              itemBuilder: (context,index) => FoodTile(
                  onTap: () => NavigateToDetails(index),
                  food: FoodMenu[index],
                  ),
                      ),
            ),
        //popular food
          const SizedBox(height: 2.0),
          Container
            (decoration:
          BoxDecoration
            (
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(20),
          ),
              margin: const EdgeInsets.only(left: 25, right: 22,bottom: 25, top: 10),
              padding: const EdgeInsets.all(20),
              child: Row
                (
                children: 
                [
                  //image
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('lib/images/sushi_egg.png', height: 100,),
                      const SizedBox(width: 10.0),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column
                      (
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                      [ //name
                        Text("Salmon eggs", style: GoogleFonts.dmSerifDisplay
                          (
                          fontSize: 20.0,
                        ),),

                        const SizedBox(height: 15.0),

                        //price
                        Text
                          ('\$15.0', style: TextStyle
                          (fontWeight: FontWeight.bold,
                            color: Colors.grey[700]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          )
        ], //children
      )
    );
  }
}

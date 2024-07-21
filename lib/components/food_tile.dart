import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../pages/food.dart';

    
    class FoodTile extends StatelessWidget {
        final Food food;
        final void Function()? onTap;

        const FoodTile({
        super.key,
          required this.onTap,
        required this.food,
      });
    
      @override
      Widget build(BuildContext context) {
        return GestureDetector(
          onTap: onTap,
          child: Container
            (
            decoration: BoxDecoration
              (
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.only(left: 25.0),
            padding: EdgeInsets.all(25.0),
            child: Column
              (
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              //image
                Image.asset(food.Imagepath, height: 140),
              //text
              Text
                (
                food.Name,
                style: GoogleFonts.dmSerifDisplay
                  (
                  fontSize: 20.0),
              ),
          
              //price+ rating
              SizedBox(
                  width: 160,
                  child: Row
                    (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:
                    [
                      Text('\$'+food.Price,style: TextStyle
                        (
                        fontWeight: FontWeight.bold,
                      ),),
                      Row
                        (
                        children: [
                      Icon
                        (Icons.star,
                        color: Colors.yellow[700],
                      ),
                      Text(
                        food.Rating,
                        style: TextStyle(color: Colors.grey[500]),
                      ),
                        ],
                      )
                    ],
                  ),),
              ],
            ),
          ),
        );
      }
    }
    

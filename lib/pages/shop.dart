import 'package:flutter/cupertino.dart';
import 'food.dart';

class Shop extends ChangeNotifier
{
  //food menu
  final List<Food> Foodmenu =
  [
    //salmon sushi
    Food
      (
        Imagepath: 'lib/images/sushe.png',
        Name: "Salmon Sushi" ,
        Price: "9.0",
        Rating: "4.8"
    ),
    //tuna sushi
    Food
      (
        Imagepath: 'lib/images/sushi_egg.png',
        Name:"Tuna Sushi",
        Price:"11.0",
        Rating: "4.9"
    ),
  ];
//customer cart
  List<Food> _cart =[];

  //getter methods
  List<Food> get FoodMenu => Foodmenu;
  List<Food> get cart => _cart;

  //add to cart
  void addToCart(Food foodItem, int quantity){
    for(int i=0; i<quantity; i++)
    {
      _cart.add(foodItem);
    }
    notifyListeners();
  }


 //remove from cart
  void removeFromCart(Food food)
  {
    _cart.remove(food);
      notifyListeners();
    }

}
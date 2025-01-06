import 'package:flutter/material.dart';
import 'drinks.dart';

class KoreanBubbleTeaShop extends ChangeNotifier {
  // List of drinks for sale
  final List<Drink> _shop = [
    Drink(
      name: "Bubble Milk Tea",
      price: "4.00",
      imagePath: "lib/images/BOBA lol.jpeg",
    ),
  ];

  // List of drinks in the user's cart
  final List<Drink> _userCart = [];

  // Get drinks for sale
  List<Drink> get shop => _shop;

  // Get user cart
  List<Drink> get cart => _userCart;

  // Add drink to cart
  void addToCart(Drink drink) {
    _userCart.add(drink);
    notifyListeners();
  }

  // Remove drink from cart
  void removeFromCart(Drink drink) {
    _userCart.remove(drink);
    notifyListeners();
  }
}

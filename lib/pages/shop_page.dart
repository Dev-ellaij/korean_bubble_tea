import 'package:flutter/material.dart';
import 'package:korean_bubble_tea/components/drink_tile.dart';
import 'package:korean_bubble_tea/models/drinks.dart';
import 'package:korean_bubble_tea/models/shop.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void goToOrderPage(Drink drink) {
    // Navigate to the order page or handle order logic here
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<KoreanBubbleTeaShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              // Heading
              Text(
                "Korean Bubble Tea Shop",
                style: TextStyle(fontSize: 20),
              ),
              // List of drinks for sale
              Expanded(
                child: ListView.builder(
                  itemCount: value!.shop.length,
                  itemBuilder: (context, index) {
                    // Get individual drink from shop
                    Drink individualDrink = value.shop[index];
                    // Return that drink as a nice tile
                    return DrinkTile(
                      drink: individualDrink,
                      onTap: () => goToOrderPage(individualDrink),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

extension on Object {
  get shop => null;
}

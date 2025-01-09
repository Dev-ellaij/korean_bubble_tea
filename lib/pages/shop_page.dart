import 'package:flutter/material.dart';
import 'package:korean_bubble_tea/components/drink_tile.dart';
import 'package:korean_bubble_tea/models/drinks.dart';
import 'package:korean_bubble_tea/models/shop.dart';
import 'package:korean_bubble_tea/pages/order_page.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void goToOrderPage(Drink drink) {
    // Navigate to the order page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderPage(drink: drink), // Pass the drink
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<KoreanBubbleTeaShop>(
      builder: (context, shopProvider, child) {
        // Check if the shop is null or empty
        if (shopProvider.shop.isEmpty) {
          return const Center(child: Text("No drinks available"));
        }

        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                // Heading
                const Text(
                  "Korean Bubble Tea Shop",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 10),

                // List of drinks for sale
                Expanded(
                  child: ListView.builder(
                    itemCount: shopProvider.shop.length,
                    itemBuilder: (context, index) {
                      // Get individual drink from shop
                      Drink individualDrink = shopProvider.shop[index];

                      // Return that drink as a nice tile
                      return DrinkTile(
                        drink: individualDrink,
                        onTap: () => goToOrderPage(individualDrink),
                        trailing:
                            const Icon(Icons.arrow_forward), // Added trailing
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

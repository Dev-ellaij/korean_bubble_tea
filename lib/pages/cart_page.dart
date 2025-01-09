import 'package:flutter/material.dart';
import 'package:korean_bubble_tea/components/drink_tile.dart';
import 'package:korean_bubble_tea/models/drinks.dart';
import 'package:korean_bubble_tea/models/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Remove drink from cart
  void removeFromCart(Drink drink) {
    Provider.of<KoreanBubbleTeaShop>(context, listen: false)
        .removeFromCart(drink);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<KoreanBubbleTeaShop>(
      builder: (context, shopProvider, child) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                // Heading
                const Text(
                  'Your Cart',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 10),

                // List of cart items
                Expanded(
                  child: ListView.builder(
                    itemCount: shopProvider.cart.length,
                    itemBuilder: (context, index) {
                      // Get individual drink in cart
                      Drink drink = shopProvider.cart[index];

                      // Return a DrinkTile for each drink
                      return DrinkTile(
                        drink: drink,
                        onTap: () => removeFromCart(drink),
                        trailing: const Icon(Icons.delete),
                      );
                    },
                  ),
                ),

                // Pay button
                MaterialButton(
                  onPressed: () {
                    // Handle payment logic here
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Payment successful!')),
                    );
                  },
                  color: Colors.brown,
                  child: const Text(
                    'PAY',
                    style: TextStyle(color: Colors.white),
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

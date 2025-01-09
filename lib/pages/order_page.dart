import 'package:flutter/material.dart';
import 'package:korean_bubble_tea/models/drinks.dart';
import 'package:korean_bubble_tea/models/shop.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget {
  final Drink drink;

  const OrderPage({
    super.key,
    required this.drink,
  });

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  // Customization sliders
  double sweetValue = 0.5;
  double iceValue = 0.5;
  double pearlValue = 0.5;

  // Customize sweetness
  void customizeSweet(double newValue) {
    setState(() {
      sweetValue = newValue;
    });
  }

  // Customize ice
  void customizeIce(double newValue) {
    setState(() {
      iceValue = newValue;
    });
  }

  // Customize pearls
  void customizePearl(double newValue) {
    setState(() {
      pearlValue = newValue;
    });
  }

  // Add to cart
  void addToCart() {
    Provider.of<KoreanBubbleTeaShop>(context, listen: false)
        .addToCart(widget.drink);

    // Navigate back to the shop
    Navigator.pop(context);

    // Notify the user
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Successfully added to cart"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.drink.name)),
      backgroundColor: Colors.brown[200],
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Drink image
            Center(
              child: Image.asset(widget.drink.imagePath, height: 200),
            ),
            const SizedBox(height: 20),

            // Sweetness slider
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 100,
                  child: Text("Sweet"),
                ),
                Expanded(
                  child: Slider(
                    value: sweetValue,
                    label: sweetValue.toString(),
                    divisions: 4,
                    onChanged: (value) => customizeSweet(value),
                  ),
                ),
              ],
            ),

            // Ice slider
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 100,
                  child: Text("Ice"),
                ),
                Expanded(
                  child: Slider(
                    value: iceValue,
                    label: iceValue.toString(),
                    divisions: 4,
                    onChanged: (value) => customizeIce(value),
                  ),
                ),
              ],
            ),

            // Pearls slider
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 100,
                  child: Text("Pearls"),
                ),
                Expanded(
                  child: Slider(
                    value: pearlValue,
                    label: pearlValue.toString(),
                    divisions: 4,
                    onChanged: (value) => customizePearl(value),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Add to cart button
            Center(
              child: MaterialButton(
                onPressed: addToCart,
                color: Colors.brown,
                textColor: Colors.white,
                child: const Text("Add to cart"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

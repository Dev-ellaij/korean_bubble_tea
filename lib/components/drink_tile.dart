import 'package:flutter/material.dart';
import 'package:korean_bubble_tea/models/drinks.dart';

class DrinkTile extends StatelessWidget {
  final Drink drink;
  final void Function()? onTap;
  final Widget trailing;

  const DrinkTile({
    super.key,
    required this.drink,
    required this.onTap,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.brown[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          title: Text(drink.name),
          trailing: trailing,
        ),
      ),
    );
  }
}

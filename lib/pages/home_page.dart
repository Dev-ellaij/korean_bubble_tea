import 'package:flutter/material.dart';
import 'package:korean_bubble_tea/components/bottom_nav_bar.dart';
import 'package:korean_bubble_tea/pages/cart_page.dart';
import 'package:korean_bubble_tea/pages/shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void navigateBottomBar(int newIndex) {
    setState(() {
      _selectedIndex = newIndex;
    });
  }

  // List of pages to display
  final List<Widget> _pages = [
    // Shop page
    const ShopPage(),

    // Cart page
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[200],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}

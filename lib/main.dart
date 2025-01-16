import 'package:flutter/material.dart';
import 'package:korean_bubble_tea/models/shop.dart';
import 'package:korean_bubble_tea/pages/home_page.dart';
import 'package:korean_bubble_tea/pages/onboarding_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => KoreanBubbleTeaShop(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.brown,
          sliderTheme: SliderThemeData(
            activeTrackColor: Colors.brown,
            inactiveTrackColor: Colors.brown[100],
            thumbColor: Colors.brown,
            overlayColor: Colors.brown.withOpacity(0.2),
          ),
        ),
        home: const OnboardingPage(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:korean_bubble_tea/pages/home_page.dart';
import 'package:korean_bubble_tea/pages/intro_pages/intro_page_1.dart';
import 'package:korean_bubble_tea/pages/intro_pages/intro_page_2.dart';
import 'package:korean_bubble_tea/pages/intro_pages/intro_page_3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  // Controller to keep track of which page we're on
  final PageController _controller = PageController();

  // Keep track of if we are on the last page or not
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // PageView
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2); // Check if it's the last page
              });
            },
            children: const [
              IntroPage1(), // First page
              IntroPage2(), // Second page
              IntroPage3(), // Third page
            ],
          ),
          // Dot indicators and navigation controls
          Align(
            alignment: const Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Skip button
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2); // Skip to the last page
                  },
                  child: const Text(
                    'Skip',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),

                // SmoothPageIndicator
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: const WormEffect(
                    activeDotColor: Colors.brown, // Match your app theme
                    dotHeight: 12,
                    dotWidth: 12,
                  ),
                ),

                // Next or Done button
                GestureDetector(
                  onTap: () {
                    if (onLastPage) {
                      // Navigate to HomePage when on the last page
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    } else {
                      // Move to the next page
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                  child: Text(
                    onLastPage ? 'Done' : 'Next',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

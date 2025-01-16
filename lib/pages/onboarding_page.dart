import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPage();
}

class _OnboardingPage extends State<OnboardingPage>
    with SingleTickerProviderStateMixin {
  // Animation controller
  late final AnimationController _controller;

  bool bubbletea = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              if (bubbletea == false) {
                bubbletea = true;
                _controller.forward();
              } else {
                bubbletea = false;
                _controller.reverse();
              }
            });
          },
          child: Lottie.network(
            'https://lottie.host/ff3c7e5f-8145-437c-8b59-9d11ef7b9684/fyFYJY78wJ.lottie',
            controller: _controller,
          ),
        ),
      ),
    );
  }
}

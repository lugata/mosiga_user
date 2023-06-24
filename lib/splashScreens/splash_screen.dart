import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Assistants/assistant_methods.dart';
import '../global/global.dart';
import '../screens/login_screen.dart';
import '../screens/main_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _gradientAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _gradientAnimation = ColorTween(
      begin: const Color.fromARGB(255, 0, 9, 107),
      end: const Color(0xFF0B0EB3),
    ).animate(_animationController);

    _animationController.repeat(reverse: true);

    Timer(const Duration(seconds: 3), () async {
      if (firebaseAuth.currentUser != null) {
        firebaseAuth.currentUser != null ? AssistantMethods() : null;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color.fromARGB(255, 21, 3, 185),
                      _gradientAnimation.value!,
                    ],
                  ),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    "images/logo.svg",
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height / (1.618 * 3),
                    width: MediaQuery.of(context).size.width / (1.618 * 3),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

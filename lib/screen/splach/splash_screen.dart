import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:test1/component/app_images.dart';
import 'package:test1/screen/welcome/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToWelcome();
  }

  Future<void> _navigateToWelcome() async {
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) =>  WelcomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          AppImages.LOTTIE,
          height: MediaQuery.sizeOf(context).height * 0.5,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
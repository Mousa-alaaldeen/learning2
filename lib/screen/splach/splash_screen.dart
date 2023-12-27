// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:test1/component/app_images.dart';
import 'package:test1/screen/welcome_screen/welcom_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => WelcomScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        child: Lottie.asset(
          AppImages.LOTTIE,
          height: MediaQuery.of(context).size.height * .5,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

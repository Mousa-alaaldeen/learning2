// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test1/component/components.dart';
import 'package:test1/component/styles.dart';

import 'package:test1/screen/islam/body_islam_screen.dart';



class IslamScreen extends StatefulWidget {
  const IslamScreen({Key? key}) : super(key: key);

  @override
  State<IslamScreen> createState() => _IslamScreenState();
}

class _IslamScreenState extends State<IslamScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "تعلم الدين الاسلامي",
          style: Styles.textStyle25,
        ),
        backgroundColor: colors4,
      ),
      body: BodyIslamScreen(),
      // bottomNavigationBar: const AdBannerModels(),
    );
  }
}

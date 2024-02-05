// ignore_for_file: avoid_print, unnecessary_const, unused_import, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test1/component/widget/ad.dart';
import 'package:test1/component/ads/ad_helper.dart';
import 'package:test1/component/ads/banner_ad.dart';
import 'package:test1/screen/home/body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          SafeArea(
            child: BodyScreen(),
          ),
        ],
      ),
    );
  }
}

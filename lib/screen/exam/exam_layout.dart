// ignore_for_file: library_private_types_in_public_api, unnecessary_import, unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:test1/component/components.dart';
import 'package:test1/component/styles.dart';

import 'build_grid_item.dart';

class ExamLayout extends StatefulWidget {
  const ExamLayout({Key? key}) : super(key: key);

  @override
  State<ExamLayout> createState() => _ExamLayoutState();
}

class _ExamLayoutState extends State<ExamLayout> {
  double w = 0.0;
  int columnCount = 2;

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: colors5,
        title: const Text(
          'اختبارات',
          style: Styles.textStyle25,
        ),
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: AnimationLimiter(
        child: GridView.count(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          padding: EdgeInsets.all(w / 60),
          crossAxisCount: columnCount,
          children: buildGridItems(context),
        ),
      ),
    );
  }
}

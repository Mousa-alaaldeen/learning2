 import 'package:flutter/material.dart';

import 'package:test1/component/styles.dart';

AppBar buildAppBar({required String title,required Color color}) {
    return AppBar(
      backgroundColor: color,
      centerTitle: true,
      title: Text(
        title,
        style: Styles.textStyle25,
      ),
    );
  }
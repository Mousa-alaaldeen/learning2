// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test1/component/components.dart';
import 'package:test1/component/styles.dart';
import 'package:test1/screen/en_screen/body.dart';

class EnScreen extends StatefulWidget {
  const EnScreen({Key? key}) : super(key: key);

  @override
  State<EnScreen> createState() => _EnScreenState();
}

class _EnScreenState extends State<EnScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'تعلم باللغه الإنجليزيه',
          style: Styles.textStyle25,
        ),
        backgroundColor: colors4,
      ),
      body: BodyEnScreen(),
    );
  }
}

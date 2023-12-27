// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test1/component/styles.dart';

class ItemSmall extends StatelessWidget {
  final Color color;
  final String text;
  final String? text2;
  final String images;
  final void Function()? onTap;
  const ItemSmall({
    Key? key,
    this.color = const Color.fromRGBO(255, 217, 183, 10),
    required this.text,
    required this.images,
    this.onTap,
    this.text2 = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: (MediaQuery.of(context).size.width / 2) - 10,
        margin: EdgeInsets.only(top: 10, left: 5, right: 5),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
        ),
        height: 300,
        child: Column(children: [
          Expanded(
            child: Image.asset(
              images,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
          ),
          Text(
            text,
            style: Styles.textStyle25,
          ),
        ]),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test1/component/styles.dart';

class ItemSmall extends StatelessWidget {
  final VoidCallback onTap;
  final Color color;
  final String images;
  final String text;

  const ItemSmall({
    Key? key,
    required this.onTap,
    required this.color,
    required this.images,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Container(
          width: (MediaQuery.of(context).size.width / 2) - 10,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: color,
          ),
          height: 300,
          child: Column(
            children: [
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
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:test1/component/app_images.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  double apple1X = 50.0;
  double apple1Y = 50.0;

  double apple2X = 150.0;
  double apple2Y = 150.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // الصندوق
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            width: 200,
            height: 200,
            color: Colors.blue,
          ),
        ),
        // التفاحة الأولى
        Positioned(
          top: apple1Y,
          left: apple1X,
          child: Draggable(
            child: Image.asset(
             AppImages.ANIMALS,
              width: 200,
              height: 200,
            ),
            feedback: Material(
              child: Image.asset(
                'assets/apple.png',
                width: 50,
                height: 50,
              ),
            ),
            onDraggableCanceled: (velocity, offset) {
              setState(() {
                apple1X = offset.dx;
                apple1Y = offset.dy;
              });
            },
          ),
        ),
        // التفاحة الثانية
        Positioned(
          top: apple2Y,
          left: apple2X,
          child: Draggable(
            child: Image.asset(
              'assets/apple.png',
              width: 50,
              height: 50,
            ),
            feedback: Material(
              child: Image.asset(
                'assets/apple.png',
                width: 50,
                height: 50,
              ),
            ),
            onDraggableCanceled: (velocity, offset) {
              setState(() {
                apple2X = offset.dx;
                apple2Y = offset.dy;
              });
            },
          ),
        ),
      ],
    );
  }
}

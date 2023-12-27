import 'package:animator/animator.dart';
import 'package:flutter/material.dart';

import 'package:test1/screen/home/home_screen.dart';

class MyIcon extends StatelessWidget {
  const MyIcon({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: SizedBox(
          height: width / 2.7,
          width: width / 2.7,
          child: Animator<double>(
            duration: const Duration(milliseconds: 1000),
            cycles: 0,
            curve: Curves.easeInOut,
            tween: Tween<double>(begin: 15.0, end: 25.0),
            builder: (context, animatorState, child) => InkWell(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                    (route) => false);
              },
              child: Icon(
                Icons.arrow_forward_ios,
                size: animatorState.value * 5,
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

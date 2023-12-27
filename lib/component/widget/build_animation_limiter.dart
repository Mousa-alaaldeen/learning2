import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class BuildAnimationLimiter extends StatelessWidget {
  const BuildAnimationLimiter({
    Key? key,
    required this.w,
    required this.pillarsOfIslam,
    required this.color,
    required this.widget,
    required this.length,
  }) : super(key: key);

  final double w;
  final List pillarsOfIslam;
  final Color color;
  final Widget widget;
  final int length;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        padding: EdgeInsets.all(w / 30),
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        itemCount: length,
        itemBuilder: (BuildContext c, int index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            delay: const Duration(milliseconds: 100),
            child: SlideAnimation(
              duration: const Duration(milliseconds: 2500),
              curve: Curves.fastLinearToSlowEaseIn,
              horizontalOffset: 30,
              verticalOffset: 300.0,
              child: FlipAnimation(
                duration: const Duration(milliseconds: 3000),
                curve: Curves.fastLinearToSlowEaseIn,
                flipAxis: FlipAxis.y,
                child: Container(
                    padding: const EdgeInsets.all(8),
                    margin: EdgeInsets.only(bottom: w / 20),
                    height: w / 4,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 40,
                          spreadRadius: 10,
                        ),
                      ],
                    ),
                    child: widget),
              ),
            ),
          );
        },
      ),
    );
  }
}


import 'package:flutter/material.dart';

class BuildCircleAvatar extends StatelessWidget {
  const BuildCircleAvatar({
    Key? key,
    required this.onTap,
  }) : super(key: key);
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Align(
        alignment: Alignment.topRight,
        child: InkWell(
            onTap: onTap,
            child: const CircleAvatar(
              radius: 25,
              child: Icon(
                Icons.keyboard_arrow_right_sharp,
              ),
            )),
      ),
    );
  }
}

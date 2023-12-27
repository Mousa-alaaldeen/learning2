import 'package:flutter/material.dart';
import 'package:test1/component/styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.title, this.onTap})
      : super(key: key);
  final String title;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: onTap,
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        Expanded(
          child: Center(
            child: Text(
              title,
              style: Styles.textStyle25,
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class CoverImage extends StatelessWidget {
  const CoverImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/welcome.jpg',
      width: 10000,
      height: MediaQuery.of(context).size.height * .4,
    );
  }
}

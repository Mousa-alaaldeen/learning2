

import 'package:flutter/material.dart';

import 'package:test1/component/styles.dart';

class TextOne extends StatelessWidget {
  const TextOne({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Center(
        child: Text(
          ' مرحبًا  !',
          style: Styles.textStyle18,
        ),
      ),
    );
  }
}

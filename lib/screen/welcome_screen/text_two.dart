import 'package:flutter/material.dart';

import 'package:test1/component/styles.dart';

class TextTwo extends StatelessWidget {
  const TextTwo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Center(
        child: Text(
          'جاهزون للتعلم؟',
          style: Styles.textStyle25,
        ),
      ),
    );
  }
}

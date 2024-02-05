import 'package:flutter/material.dart';
import 'package:test1/component/ads/interstitial_ad.dart';
import 'package:test1/component/app_images.dart';
import 'package:test1/component/components.dart';
import 'package:test1/component/styles.dart';
import 'package:test1/component/widget/item_small.dart';
import 'package:test1/screen/ar_screen/black_board.dart';
import 'package:test1/screen/ar_screen/letter_screen.dart';
import 'package:test1/screen/ar_screen/number_screen.dart';
import 'package:test1/screen/ar_screen/senses_screen.dart';

class ArScreen extends StatefulWidget {
  const ArScreen({Key? key}) : super(key: key);

  @override
  State<ArScreen> createState() => _ArScreenState();
}

class _ArScreenState extends State<ArScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'تعلم باللغه العربيه',
          style: Styles.textStyle25,
        ),
        backgroundColor: colors1,
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Row(
                children: [
                  ItemSmall(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NumberScreen(),
                      ),
                    ),
                    color: colors2,
                    text: "الارقام العربيه",
                    images: AppImages.NUMBER_AR,
                  ),
                  ItemSmall(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LetterScreen(),
                      ),
                    ),
                    color: colors4,
                    images: AppImages.LETTER_AR,
                    text: ' الحروف العربيه',
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Row(
                children: [
                  ItemSmall(
                    onTap: () {
                      Ads().showAd();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DrawingScreen(),
                        ),
                      );
                    },
                    color: colors3,
                    text: 'كتابة الحروف العربيه',
                    images: AppImages.education,
                  ),
                  ItemSmall(
                    onTap: () {
                      Ads().showAd();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SensesScreen(),
                        ),
                      );
                    },
                    color: colors4,
                    text:  "الحواس الخمس",
                    images: AppImages.senses,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

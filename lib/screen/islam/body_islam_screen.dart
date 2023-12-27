// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test1/component/ads/interstitial_ad.dart';
import 'package:test1/component/app_images.dart';
import 'package:test1/component/components.dart';
import 'package:test1/component/widget/item_small.dart';
import 'package:test1/screen/islam/ablution_screen.dart';
import 'package:test1/screen/islam/azan_screen.dart';
import 'package:test1/screen/islam/pillars_of_faith.dart';
import 'package:test1/screen/islam/pillars_of_islam.dart';
import 'package:test1/screen/islam/tashahhud_screen.dart';

class BodyIslamScreen extends StatelessWidget {
  const BodyIslamScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Row(
              children: [
                ItemSmall(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PillarsOfIslam(),
                    ),
                  ),
                  color: colors3,
                  text: 'الاركان الاسلام',
                  images: AppImages.PillarsOfIslam,
                ),
                ItemSmall(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PillarsOfFaith(),
                    ),
                  ),
                  color: colors5,
                  images: AppImages.PillarsOfFaith,
                  text: 'اركان الايمان',
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: ItemSmall(
              onTap: () {
                Ads().showAd();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AblutionScreen(),
                  ),
                );
              },
              color: colors2,
              text: "تعلم الوضوء",
              images: AppImages.Ablution,
            ),
          ),
          SliverToBoxAdapter(
            child: Row(
              children: [
                ItemSmall(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AzanScreen(),
                    ),
                  ),
                  color: colors4,
                  text: 'الاذان و دعاء الاذان',
                  images: AppImages.azan,
                ),
                ItemSmall(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TashahhudScreen(),
                    ),
                  ),
                  color: colors1,
                  text: "التشهد و الصلاة الابراهميه",
                  images: AppImages.tashahhud,
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
        ],
      ),
    );
  }
}

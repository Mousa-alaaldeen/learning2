import 'package:flutter/material.dart';
import 'package:test1/component/ads/interstitial_ad.dart';
import 'package:test1/component/app_images.dart';
import 'package:test1/component/components.dart';
import 'package:test1/component/widget/item_small.dart';
import 'package:test1/screen/en_screen/letter_en_screen.dart';
import 'package:test1/screen/en_screen/number_en_screen.dart';
import 'package:test1/screen/en_screen/storeis/storeis_layout.dart';
import 'package:test1/screen/en_screen/week_days.dart';

class BodyEnScreen extends StatelessWidget {
  const BodyEnScreen({
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
                      builder: (context) => const NumberEnScreen(),
                    ),
                  ),
                  color: colors4,
                  text: 'الأرقام الإنجليزيه',
                  images: AppImages.NUMBER_EN,
                ),
                ItemSmall(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LetterEnScreen(),
                    ),
                  ),
                  color: colors1,
                  text: 'الحروف الإنجليزيه',
                  images: AppImages.LETTER_EN,
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
                        builder: (context) => const StoreisScreen(),
                      ),
                    );
                  },
                  color: colors5,
                  text: 'قصص باللغه الإنجليزيه',
                  images: AppImages.stories,
                ),
                ItemSmall(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WeekDaysScreen(),
                    ),
                  ),
                  color: colors3,
                  text: 'ايام الاسبوع',
                  images: AppImages.WeekDays,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

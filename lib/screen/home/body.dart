import 'package:flutter/material.dart';
import 'package:test1/component/ads/interstitial_ad.dart';
import 'package:test1/component/app_images.dart';
import 'package:test1/component/components.dart';
import 'package:test1/component/widget/item_small.dart';
import 'package:test1/screen/animal_screen.dart/animal_screen.dart';
import 'package:test1/screen/ar_screen/ar_screen.dart';
import 'package:test1/screen/colors/colora_screen.dart';
import 'package:test1/screen/en_screen/en_screen.dart';
import 'package:test1/screen/exam/exam_layout.dart';
import 'package:test1/screen/islam/islam_screen.dart';

class BodyScreen extends StatelessWidget {
  const BodyScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Row(
            children: [
              ItemSmall(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ArScreen(),
                  ),
                ),
                color: colors1,
                text: 'تعلم اللغة العربية',
                images: AppImages.LETTER_AR,
              ),
              ItemSmall(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EnScreen(),
                    ),
                  );
                },
                color: colors2,
                text: 'تعلم اللغة الإنجليزية',
                images: AppImages.LETTER_EN,
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
                  builder: (context) => const AnimalScreen(),
                ),
              );
            },
            color: colors5,
            text: 'أصوات الحيوانات',
            images: AppImages.ANIMALS,
          ),
        ),
        SliverToBoxAdapter(
          child: Row(
            children: [
              ItemSmall(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ColorsScreen(),
                  ),
                ),
                color: colors3,
                text: 'تعلم الألوان',
                images: AppImages.color,
              ),
              ItemSmall(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const IslamScreen(),
                  ),
                ),
                color: colors4,
                text: 'تعلم الدين الإسلامي',
                images: AppImages.muslem,
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ItemSmall(
              onTap: () {
                Ads().showAd();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ExamLayout(),
                  ),
                );
              },
              color: colors5,
              text: 'الاختبارات',
              images: AppImages.exam,
            ),
          ),
        ),
      ],
    );
  }
}

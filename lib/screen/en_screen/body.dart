// body.dart
// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:test1/component/ads/interstitial_ad.dart';
import 'package:test1/component/app_images.dart';
import 'package:test1/component/components.dart';
import 'package:test1/component/widget/item_small.dart';
import 'package:test1/screen/en_screen/senses_en_screen.dart';
import 'package:test1/screen/en_screen/writing_letter_en.dart';
import 'package:test1/screen/en_screen/letter_en_screen.dart';
import 'package:test1/screen/en_screen/number_en_screen.dart';
import 'package:test1/screen/en_screen/storeis/storeis_layout.dart';
import 'package:test1/screen/en_screen/week_days.dart';
import 'package:test1/screen/en_screen/writing_numbers_en.dart';

class BodyEnScreen extends StatelessWidget {
  const BodyEnScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          _buildRow1(context),
          _buildRow2(context),
          _buildSensesItem(context),
          _buildRow3(context),
        ],
      ),
    );
  }

  Widget _buildRow1(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        children: [
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
          ItemSmall(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const WritingLerrerEn(),
              ),
            ),
            color: colors2,
            text: 'كتابة الحروف الإنجليزيه ',
            images: AppImages.writingLetterEn,
          ),
        ],
      ),
    );
  }

  Widget _buildRow2(BuildContext context) {
    return SliverToBoxAdapter(
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
                builder: (context) => const WritingNumbersEn(),
              ),
            ),
            color: colors3,
            text: 'كتابةالأرقام ',
            images: AppImages.writingNumberEn,
          ),
        ],
      ),
    );
  }

  Widget _buildSensesItem(BuildContext context) {
    return SliverToBoxAdapter(
      child: ItemSmall(
        onTap: () {
          Ads().showAd();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SensesEnScreen(),
            ),
          );
        },
        color: colors7,
        text: '',
        images: AppImages.sensesEn,
      ),
    );
  }

  Widget _buildRow3(BuildContext context) {
    return SliverToBoxAdapter(
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
            color: colors10,
            text: 'ايام الاسبوع',
            images: AppImages.WeekDays,
          ),
        ],
      ),
    );
  }
}

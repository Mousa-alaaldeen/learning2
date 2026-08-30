import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test1/features/home/controllers/home_controller.dart' show HomeController;

import '../../../core/theme/app_colors.dart';
import '../../features/home/widgets/home_body.dart';


class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: HomeBody(controller: controller),
      ),
    );
  }
}

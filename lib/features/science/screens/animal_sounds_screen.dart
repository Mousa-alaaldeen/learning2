// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';

import '../../../data/local/learning_data.dart';
import '../controllers/animal_controller.dart';

class AnimalSoundsScreen extends GetView<AnimalController> {
  const AnimalSoundsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.lettersTitle,
          ),
        ),
        title: const Text(
          'أصوات الحيوانات 🐾',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w900,
            color: AppColors.lettersTitle,
          ),
        ),
      ),
      body: Obx(
        () {
          final selectedIndex = controller.selectedAnimalIndex.value;
          final selectedAnimal = LearningData.animalsList[selectedIndex];

          return Column(
            children: [
              const SizedBox(height: 8),
              const Text(
                'اضغط على الحيوان واستمع إلى صوته 🔊',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: AppColors.lettersTitle,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                height: 180,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 12,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    selectedAnimal.emoji,
                    style: const TextStyle(
                      fontSize: 105,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                selectedAnimal.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: AppColors.lettersTitle,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.fromLTRB(
                    16,
                    0,
                    16,
                    24,
                  ),
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.9,
                  ),
                  itemCount:LearningData. animalsList.length,
                  itemBuilder: (context, index) {
                    final animal = LearningData.animalsList[index];
                    final isSelected = selectedIndex == index;

                    return GestureDetector(
                      onTap: () => controller.selectAnimal(index),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        decoration: BoxDecoration(
                          color:
                              isSelected ? AppColors.lettersBlue : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.06),
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              animal.emoji,
                              style: const TextStyle(
                                fontSize: 52,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              animal.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: AppColors.lettersTitle,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Icon(
                              isSelected
                                  ? Icons.volume_up_rounded
                                  : Icons.volume_up_outlined,
                              size: 20,
                              color: isSelected
                                  ? AppColors.lettersTitle
                                  : Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

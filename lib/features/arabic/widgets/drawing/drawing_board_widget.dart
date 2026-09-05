import 'package:flutter/material.dart';
import 'package:flutter_drawing_board/flutter_drawing_board.dart';

import '../../../../core/theme/app_colors.dart';
import '../../controllers/writing_controller.dart';

class DrawingBoardWidget extends StatelessWidget {
  final WritingController controller;

  const DrawingBoardWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return DrawingBoard(
              boardPanEnabled: false,
              boardScaleEnabled: false,
              controller: controller.drawingController,
              background: Container(
                alignment: Alignment.center,
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                child: Stack(
                  children: [
                    Center(
                      child: Text(
                        controller.currentLetter.letter,
                        style: TextStyle(
                          fontFamily: 'Amiri',
                          fontSize: 280,
                          fontWeight: FontWeight.bold,
                          color: AppColors.lettersProgressBackground,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 20,
                      left: 20,
                      child: Container(
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                          color: AppColors.arabicLetters.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Icon(
                          controller.currentLetter.icon,
                          size: 30,
                          color: AppColors.lettersBlue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_drawing_board/flutter_drawing_board.dart';

import '../../../../core/theme/app_colors.dart';
import '../../controllers/writing_controller.dart';

class DrawingBoardWidget extends StatelessWidget {
  const DrawingBoardWidget({
    super.key,
    required this.controller,
  });

  final DrawingPageController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 20,
            offset: const Offset(0, 8),
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
              background: SizedBox(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                  child: Icon(
                    controller.currentLetter.icon,
                    color: AppColors.arabic,
                  )),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'game_round_button.dart';

class GameTopBar extends StatelessWidget {
  const GameTopBar({
    super.key,
    required this.center,
    required this.onHome,
    required this.onSpeak,
  });

  final Widget center;
  final VoidCallback onHome;
  final VoidCallback onSpeak;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        14,
        10,
        14,
        4,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GameRoundButton(
            icon: Icons.home_rounded,
            onTap: onHome,
          ),

          center,

          GameRoundButton(
            icon: Icons.volume_up_rounded,
            onTap: onSpeak,
          ),
        ],
      ),
    );
  }
}

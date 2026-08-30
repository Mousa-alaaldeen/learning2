import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test1/component/app_audio.dart';
import 'package:test1/screen/welcome/welcome_controller.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final WelcomeController controller = Get.put(WelcomeController());
  final AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _playWelcomeSound();
  }

  Future<void> _playWelcomeSound() async {
    await player.play(
      AssetSource(AppOudio.Welcome),
    );
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                SizedBox(height: size.height * 0.04),
                Container(
                  width: double.infinity,
                  height: size.height * 0.42,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.08),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(
                    'assets/images/welcome.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: size.height * 0.04),
                Text(
                  'مرحبًا بك! 👋',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontFamily: 'Amiri',
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: const Color(0xFF2F5D7E),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'جاهزون للتعلم؟',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontFamily: 'Amiri',
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'تعلم بطريقة ممتعة، والعب واكتشف أشياء جديدة كل يوم.',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontFamily: 'Amiri',
                    color: Colors.grey.shade600,
                    height: 1.6,
                  ),
                ),
                SizedBox(height: size.height * 0.04),
                SizedBox(
                  width: double.infinity,
                  height: 58,
                  child: ElevatedButton(
                    onPressed: controller.startLearning,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2F5D7E),
                      foregroundColor: Colors.white,
                      elevation: 4,
                      shadowColor: const Color(0xFF2F5D7E).withValues(
                        alpha: 0.3,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ابدأ التعلم',
                          style: TextStyle(
                            fontFamily: 'Amiri',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.arrow_forward_rounded),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

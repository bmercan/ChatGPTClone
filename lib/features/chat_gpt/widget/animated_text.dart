import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AnimatedTextWidget extends StatelessWidget {
  const AnimatedTextWidget({required this.text, super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context)
          .textTheme
          .titleMedium!
          .copyWith(color: Colors.white),
      child: AnimatedTextKit(
        isRepeatingAnimation: false,
        animatedTexts: [
          TyperAnimatedText(
            text,
            speed: const Duration(milliseconds: 50),
          ),
        ],
      ),
    );
  }
}

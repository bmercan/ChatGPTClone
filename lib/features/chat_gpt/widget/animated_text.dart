import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AnimatedTextWidget extends StatefulWidget {
  const AnimatedTextWidget({required this.text, super.key});
  final String text;

  @override
  State<AnimatedTextWidget> createState() => _AnimatedTextWidgetState();
}

class _AnimatedTextWidgetState extends State<AnimatedTextWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTextStyle(
      style: Theme.of(context)
          .textTheme
          .titleMedium!
          .copyWith(color: Colors.white),
      child: AnimatedTextKit(
        // key: const PageStorageKey<String>('animated_text'),
        isRepeatingAnimation: false,
        animatedTexts: [
          TyperAnimatedText(
            widget.text,
            speed: const Duration(milliseconds: 10),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

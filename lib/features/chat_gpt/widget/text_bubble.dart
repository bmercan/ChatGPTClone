import 'package:flutter/material.dart';
import 'package:openaimobile/config/enums/users.dart';
import 'package:openaimobile/features/chat_gpt/model/message.dart';
import 'package:openaimobile/features/chat_gpt/widget/animated_text.dart';

class TextBubble extends StatelessWidget {
  const TextBubble({required this.message, required this.index, super.key});
  final Message message;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header(context),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 34),
                  child: AnimatedTextWidget(text: message.content ?? ''),
                ),
              ),
              if (message.success!)
                const SizedBox.shrink()
              else
                const Icon(
                  Icons.error_outline,
                  color: Colors.red,
                )
            ],
          ),
        ],
      ),
    );
  }

  SizedBox header(BuildContext context) {
    return SizedBox(
      height: 24,
      child: Row(
        children: [
          CircleAvatar(
            radius: 15,
            foregroundImage: AssetImage(
              message.role?.toImage ?? UserEnum.user.toImage,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            message.role?.toName ?? 'USER',
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
          ),
        ],
      ),
    );
  }
}

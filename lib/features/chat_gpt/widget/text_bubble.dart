import 'package:flutter/material.dart';
import 'package:openaimobile/features/chat_gpt/model/message.dart';
import 'package:openaimobile/features/chat_gpt/model/prompt.dart';
import 'package:openaimobile/features/chat_gpt/widget/animated_text.dart';

class TextBubble extends StatelessWidget {
  const TextBubble({required this.message, super.key});
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 24,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 15,
                  foregroundImage: NetworkImage(
                    message.role == UserEnum.user
                        ? 'https://lh3.googleusercontent.com/ogw/AGvuzYai0axOPglGgX7nffwwQmlcBQs-8PbG8PP5DcsR5w=s64-c-mo'
                        : 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/ChatGPT_logo.svg/1200px-ChatGPT_logo.svg.png',
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  message.role == UserEnum.user ? 'MERCAN' : 'CHAT-GPT',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 34),
            child: AnimatedTextWidget(text: message.content ?? ''),
          ),
        ],
      ),
    );
  }
}

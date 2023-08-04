import 'package:flutter/material.dart';
import 'package:openaimobile/features/chat_gpt/provider/prompt_provider.dart';
import 'package:openaimobile/features/chat_gpt/widget/text_bubble.dart';
import 'package:provider/provider.dart';

class ChatView extends StatelessWidget {
  const ChatView({required this.controller, super.key});
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return Consumer<PromptProvider>(
      builder: (context, value, child) {
        return Expanded(
          child: value.chat.isEmpty
              ? Center(
                  child: Text(
                    'ChatGPT',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                )
              : ListView.builder(
                  controller: controller,
                  itemCount: value.chat.length,
                  itemBuilder: (context, index) {
                    return TextBubble(
                      message: value.chat[index]!,
                      index: index,
                    );
                  },
                ),
        );
      },
    );
  }
}

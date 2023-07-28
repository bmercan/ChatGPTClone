import 'package:flutter/material.dart';
import 'package:openaimobile/features/chat_gpt/model/prompt_model.dart';
import 'package:openaimobile/features/chat_gpt/view/home.dart';
import 'package:openaimobile/features/chat_gpt/widget/text_bubble.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chat.length,
      itemBuilder: (context, index) {
        return TextBubble(
          text: chat[index].prompt ?? '',
          user: chat[index].user ?? UserEnum.user,
        );
      },
    );
  }
}

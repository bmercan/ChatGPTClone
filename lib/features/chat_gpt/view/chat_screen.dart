import 'package:flutter/material.dart';
import 'package:openaimobile/features/chat_gpt/provider/prompt_provider.dart';
import 'package:openaimobile/features/chat_gpt/widget/text_bubble.dart';
import 'package:provider/provider.dart';

class ChatView extends StatefulWidget {
  const ChatView({required this.controller, super.key});
  final ScrollController controller;
  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer<PromptProvider>(
      builder: (context, value, child) => Expanded(
        child: ListView.builder(
          controller: widget.controller,
          //    key: const PageStorageKey<String>("my_list"),
          itemCount: value.chat.length,
          itemBuilder: (context, index) {
            return TextBubble(
              message: value.chat[index]!,
            );
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => false;
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:openaimobile/features/chat_gpt/model/chat.dart';
import 'package:openaimobile/features/chat_gpt/provider/prompt_provider.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({required this.controller, super.key});
  final ScrollController controller;
  @override
  Widget build(BuildContext context) {
    final messageHistoryBox = context.read<PromptProvider>().chatBox;
    final theme = Theme.of(context).colorScheme;
    return ColoredBox(
      color: Theme.of(context).colorScheme.surfaceTint,
      child: Column(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: theme.surfaceTint,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: null,
                  icon: Icon(
                    CupertinoIcons.xmark_circle_fill,
                    color: theme.surfaceTint,
                  ),
                ),
                Text(
                  'History',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    CupertinoIcons.xmark_circle_fill,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: messageHistoryBox.length,
              itemBuilder: (context, index) {
                final messages = messageHistoryBox.values.toList();
                final keys = messageHistoryBox.keys.toList();
                return tile(
                  context: context,
                  messages: messages[index],
                  sessionName: keys[index].toString(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget tile({
    required BuildContext context,
    required HiveChatModel messages,
    required String sessionName,
  }) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        onTap: () {
          context.read<PromptProvider>().loadChat(
                hiveChat: messages,
                sessionName: sessionName,
              );
          Navigator.pop(context);
        },
        title: Text(
          messages.title ?? '',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          messages.chat?.last?.content ?? '',
          style: Theme.of(context).textTheme.bodyMedium,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

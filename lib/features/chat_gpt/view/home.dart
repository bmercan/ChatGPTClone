import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:openaimobile/config/constants/app_constants.dart';
import 'package:openaimobile/config/enums/users.dart';
import 'package:openaimobile/features/chat_gpt/model/message.dart';
import 'package:openaimobile/features/chat_gpt/model/prompt.dart';
import 'package:openaimobile/features/chat_gpt/provider/prompt_provider.dart';
import 'package:openaimobile/features/chat_gpt/widget/chat.dart';
import 'package:provider/provider.dart';

List<PromptModel> chat = [];

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController _textEditingController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _firstAutoscrollExecuted = false;
  bool _shouldAutoscroll = false;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.more_horiz),
        onPressed: () {},
      ),
      body: Column(
        children: [
          ChatView(
            controller: _scrollController,
          ),
          textField(),
        ],
      ),
    );
  }

  SafeArea textField() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _textEditingController,
                style: const TextStyle(color: Colors.white),
                onSubmitted: (value) {
                  FocusScope.of(context).unfocus();
                },
                decoration: const InputDecoration(
                  hintText: 'Hey...',
                ),
              ),
            ),
            GestureDetector(
              onTap: sendPrompt,
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: Colors.purple,
                  shape: BoxShape.circle,
                ),
                child: context.watch<PromptProvider>().responding
                    ? const SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      )
                    : const Icon(Icons.arrow_upward, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> sendPrompt() async {
    final provider = context.read<PromptProvider>();
    final prompt = _textEditingController.text;
    _textEditingController.clear();
    FocusScope.of(context).unfocus();
    await provider.sendPrompt(prompt: prompt);
    if (_scrollController.hasClients && _shouldAutoscroll) {
      _scrollToBottom();
    }
    if (!_firstAutoscrollExecuted && _scrollController.hasClients) {
      _scrollToBottom();
    }
  }

  void _scrollToBottom() {
    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  }

  void _scrollListener() {
    _firstAutoscrollExecuted = true;

    if (_scrollController.hasClients &&
        _scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
      _shouldAutoscroll = true;
    } else {
      _shouldAutoscroll = false;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:openaimobile/features/chat_gpt/model/prompt.dart';
import 'package:openaimobile/features/chat_gpt/provider/prompt_provider.dart';
import 'package:openaimobile/features/chat_gpt/service/prompt_service.dart';
import 'package:openaimobile/features/chat_gpt/view/chat_screen.dart';
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

  /* void sendNewMessage({
    required String message,
    UserEnum user = UserEnum.user,
  }) {
    if (message.isEmpty) return;
    final prompt = PromptModel(
      prompt: message,
      user: user,
    );
    print(prompt.prompt);

    // FocusScope.of(context).unfocus();
    setState(() {
      chat.add(prompt);
    });
    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);

    _textEditingController.clear();
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Chat-GPT',
        ),
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
    final provider = context.read<PromptProvider>();
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
                decoration: InputDecoration(
                  suffixIcon: provider.responding
                      ? const CircularProgressIndicator()
                      : null, //Icon(Icons.close),
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
                child: const Icon(Icons.arrow_forward, color: Colors.white),
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
    await provider.sendPrompt(prompt: prompt);
    /*  if (response != null && response) {
      print('error');

      _textEditingController.text = prompt;
    } else {
      print('object');
    } */
  }
}

import 'package:flutter/material.dart';
import 'package:openaimobile/config/theme/theme.dart';
import 'package:openaimobile/features/chat_gpt/provider/prompt_provider.dart';
import 'package:openaimobile/features/chat_gpt/view/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const OpenAI());
}

class OpenAI extends StatelessWidget {
  const OpenAI({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PromptProvider(),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Material App',
          home: const HomeView(),
          theme: Themes.darkTheme,
        );
      },
    );
  }
}

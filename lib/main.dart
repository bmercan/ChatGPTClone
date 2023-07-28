import 'package:flutter/material.dart';
import 'package:openaimobile/features/chat_gpt/view/home.dart';

void main() {
  runApp(const OpenAI());
}

class OpenAI extends StatelessWidget {
  const OpenAI({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: HomeView(),
    );
  }
}

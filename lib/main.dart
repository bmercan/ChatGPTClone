import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:openaimobile/config/theme/theme.dart';
import 'package:openaimobile/features/chat_gpt/model/message.dart';
import 'package:openaimobile/features/chat_gpt/provider/prompt_provider.dart';
import 'package:openaimobile/features/chat_gpt/view/home.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

/* 
Future<void> openBox() async {
  Hive.registerAdapter(HiveChatPromptModelAdapter());
  Hive.registerAdapter(ChatPromptModelAdapter());
  Hive.registerAdapter(HiveImagePromptModelAdapter());
  await Hive.openBox<HiveImagePromptModel>('imageBox');
  await Hive.openBox<HiveChatPromptModel>('chatBox');
}
 */
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final document = await getApplicationDocumentsDirectory();

  Hive.init(document.path);

  await Hive.openBox<Message>('mybox');

  await dotenv.load();
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

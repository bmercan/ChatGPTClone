import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:openaimobile/config/constants/app_constants.dart';
import 'package:openaimobile/config/enums/users.dart';
import 'package:openaimobile/config/theme/theme.dart';
import 'package:openaimobile/features/chat_gpt/model/choice.dart';
import 'package:openaimobile/features/chat_gpt/model/message.dart';
import 'package:openaimobile/features/chat_gpt/model/prompt.dart';
import 'package:openaimobile/features/chat_gpt/model/testmodel.dart';
import 'package:openaimobile/features/chat_gpt/provider/prompt_provider.dart';
import 'package:openaimobile/features/chat_gpt/view/home.dart';
import 'package:openaimobile/features/chat_gpt/view/test.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

Future<void> openBox() async {
  WidgetsFlutterBinding.ensureInitialized();
  final document = await getApplicationDocumentsDirectory();
  await dotenv.load();
  Hive
    ..init(document.path)
    ..registerAdapter(ChoiceAdapter())
    ..registerAdapter(MessageAdapter())
    ..registerAdapter(PromptModelAdapter())
    ..registerAdapter(UserEnumAdapter())
    ..registerAdapter(HiveChatModelAdapter());
  await Hive.openBox<HiveChatModel>(AppConstants.chatBox);
}

Future<void> main() async {
  await openBox();
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
          home: TestScreen(), //const HomeView(), //
          darkTheme: Themes.darkTheme,
        );
      },
    );
  }
}

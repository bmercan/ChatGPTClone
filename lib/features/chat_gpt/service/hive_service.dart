import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:openaimobile/config/constants/app_constants.dart';
import 'package:openaimobile/config/enums/users.dart';
import 'package:openaimobile/features/chat_gpt/model/chat.dart';
import 'package:openaimobile/features/chat_gpt/model/choice.dart';
import 'package:openaimobile/features/chat_gpt/model/message.dart';
import 'package:openaimobile/features/chat_gpt/model/prompt.dart';
import 'package:path_provider/path_provider.dart';

class HiveService {
  static Future<void> openBox() async {
    WidgetsFlutterBinding.ensureInitialized();
    await dotenv.load();
    final document = await getApplicationDocumentsDirectory();
    Hive
      ..init(document.path)
      ..registerAdapter(ChoiceAdapter())
      ..registerAdapter(MessageAdapter())
      ..registerAdapter(PromptModelAdapter())
      ..registerAdapter(UserEnumAdapter())
      ..registerAdapter(HiveChatModelAdapter());
    await Hive.openBox<HiveChatModel>(AppConstants.chatBox);
  }
}

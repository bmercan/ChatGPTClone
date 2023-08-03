import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:openaimobile/config/constants/app_constants.dart';
import 'package:openaimobile/config/enums/users.dart';
import 'package:openaimobile/features/chat_gpt/model/http_helper.dart';
import 'package:openaimobile/features/chat_gpt/model/message.dart';
import 'package:openaimobile/features/chat_gpt/model/testmodel.dart';
import 'package:openaimobile/features/chat_gpt/service/prompt_service.dart';

class PromptProvider extends ChangeNotifier {
  bool _responding = false;
  List<Message?> _messageHistory = [];

  String? _sessionName;
  final Box<HiveChatModel> _messageHistoryBox =
      Hive.box<HiveChatModel>(AppConstants.chatBox);

  List<Message?> get chat => _messageHistory;
  Box<HiveChatModel> get chatBox => _messageHistoryBox;
  bool get responding => _responding;

  void _changeRespondingState() {
    _responding = !responding;
    notifyListeners();
  }

  Future<void> sendPrompt({required String prompt}) async {
    if (prompt.isEmpty || _responding) return;
    _changeRespondingState();
    _messageHistory.add(Message(role: UserEnum.user, content: prompt));
    final response = await PromptService.instance.sendPrompt(
      messageHistory: _messageHistory,
    );
    if (response is DataSuccess) {
      _messageHistory.add(response.data?.choices?.first.message);
    } else {
      _messageHistory.last?.success = false;
    }
    await saveChat(message: _messageHistory);
    _changeRespondingState();
  }

  Future<void> loadChat({
    required HiveChatModel hiveChat,
    required String sessionName,
  }) async {
    _messageHistory.clear();
    notifyListeners();
    await Future.delayed(
      const Duration(milliseconds: 11),
    );
    _messageHistory = hiveChat.chat ?? [];
    _sessionName = sessionName;
    notifyListeners();
  }

  Future<bool> saveChat({required List<Message?> message}) async {
    // if message is empty, new session
    try {
      newSession();
      final chat = HiveChatModel(
        date: DateTime.now(),
        title: message.first?.content ?? '',
        chat: message,
      );
      await _messageHistoryBox.put(_sessionName, chat);
      return true;
    } catch (e) {
      return false;
    }
  }

  void newSession({bool newSession = false}) {
    if (newSession) {
      _sessionName = 'session_${_messageHistoryBox.values.length + 1}';
    }
    if (_sessionName == null) {
      if (_messageHistoryBox.values.isEmpty) {
        _sessionName = 'session_0';
      } else {
        _sessionName = 'session_${_messageHistoryBox.values.length + 1}';
      }
    }
    notifyListeners();
  }

  void newChat() {
    _messageHistory.clear();
    newSession(newSession: true);
    notifyListeners();
  }
}

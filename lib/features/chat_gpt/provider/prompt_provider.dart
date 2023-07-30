import 'package:flutter/widgets.dart';
import 'package:openaimobile/features/chat_gpt/model/http_helper.dart';
import 'package:openaimobile/features/chat_gpt/model/message.dart';
import 'package:openaimobile/features/chat_gpt/model/prompt.dart';
import 'package:openaimobile/features/chat_gpt/service/prompt_service.dart';

class PromptProvider extends ChangeNotifier {
  bool _responding = false;
  final List<Message?> _messageHistory = [];
  String _lastPrompt = "";
  bool _isFailed = false;

  List<Message?> get chat => _messageHistory;
  bool get responding => _responding;
  bool get isFailed => _isFailed;

  void _changeRespondingState() {
    _responding = !responding;
    notifyListeners();
  }

  Future<void> sendPrompt({required String prompt}) async {
    if (prompt.isEmpty) return;
    _changeRespondingState();
    _lastPrompt = prompt;
    _messageHistory.add(Message(role: UserEnum.user, content: prompt));
    final response = await PromptService.instance.sendPrompt(
      messageHistory: _messageHistory,
    );
    if (response is DataSuccess) {
      _messageHistory.add(response.data?.choices?.first.message);
      _isFailed = false;
    } else {
      _isFailed = true;
      print("patladı : ${response.error?.response}");
    }
    _changeRespondingState();
  }
}

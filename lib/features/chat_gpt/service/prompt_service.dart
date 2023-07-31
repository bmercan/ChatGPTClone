import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:openaimobile/config/constants/app_constants.dart';
import 'package:openaimobile/features/chat_gpt/model/http_helper.dart';
import 'package:openaimobile/features/chat_gpt/model/message.dart';
import 'package:openaimobile/features/chat_gpt/model/prompt.dart';

class PromptService {
  PromptService._internal();
  static PromptService? _instance;
  static PromptService get instance {
    if (_instance == null) {
      return _instance = PromptService._internal();
    } else {
      return _instance!;
    }
  }

  final Dio dio = Dio();

  Future<DataState<PromptModel?>> sendPrompt({
    required List<Message?> messageHistory,
  }) async {
    try {
      final httpResponse = await dio.post<Object?>(
        'https://api.openai.com/v1/chat/completions',
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.authorizationHeader: 'Bearer ${AppConstants.token}',
          },
        ),
        data: {
          'model': AppConstants.chatGPTModel,
          'messages': messageHistory,
        },
      );
      print("responsee : ${httpResponse}");
      if (httpResponse.statusCode == HttpStatus.ok) {
        return DataSuccess(
          PromptModel.fromJson(httpResponse.data! as Map<String, dynamic>),
        );
      } else {
        return DataFailed(
          DioException(
            requestOptions: httpResponse.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      print("responsee ${e.response}");
      return DataFailed(e);
    }
  }
}

// ignore: depend_on_referenced_packages
import 'package:flutter_dotenv/flutter_dotenv.dart' show dotenv;

class APIConstants {
  static String baseUrl = 'https://api.openai.com/';
  static String authToken = 'Bearer ${dotenv.env['BEARER_TOKEN']}';
  static String chatGPTModel = 'gpt-3.5-turbo';
  static String contentType = 'application/json';
}

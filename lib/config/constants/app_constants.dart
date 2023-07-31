// ignore: depend_on_referenced_packages
import 'package:flutter_dotenv/flutter_dotenv.dart' show dotenv;

class AppConstants {
  static String token = dotenv.env['BEARER_TOKEN'] ?? '';
  static String chatGPTModel = 'gpt-3.5-turbo';
}

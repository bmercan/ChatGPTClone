import 'package:openaimobile/config/constants/api_constants.dart';

enum APIEndPoints {
  chatGPT('v1/chat/completions');

  const APIEndPoints(this.value);
  final String value;

  String get toFullUrl => '${APIConstants.baseUrl}$value';
}

import 'package:json_annotation/json_annotation.dart';
import 'package:openaimobile/features/chat_gpt/model/message.dart';

part 'choice.g.dart';

@JsonSerializable()
class Choice {
  Choice({
    this.index,
    this.message,
    this.finishReason,
  });
  final int? index;
  final Message? message;
  final String? finishReason;

  factory Choice.fromJson(Map<String, dynamic> json) => _$ChoiceFromJson(json);
  Map<String, dynamic> toJson() => _$ChoiceToJson(this);

  @override
  String toString() =>
      'Choice(index: $index, message: $message, finishReason: $finishReason)';
}

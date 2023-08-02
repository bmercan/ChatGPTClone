import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:openaimobile/features/chat_gpt/model/message.dart';

part 'choice.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class Choice {
  Choice({
    this.index,
    this.message,
    this.finishReason,
  });
  @HiveField(0)
  final int? index;
  @HiveField(1)
  final Message? message;
  @HiveField(2)
  final String? finishReason;

  factory Choice.fromJson(Map<String, dynamic> json) => _$ChoiceFromJson(json);
  Map<String, dynamic> toJson() => _$ChoiceToJson(this);

  @override
  String toString() =>
      'Choice(index: $index, message: $message, finish_reason: $finishReason)';
}

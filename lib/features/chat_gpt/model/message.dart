import 'package:json_annotation/json_annotation.dart';
import 'package:openaimobile/features/chat_gpt/model/prompt.dart';

part 'message.g.dart';

@JsonSerializable()
class Message {
  UserEnum? role;
  String? content;
  Message({
    this.role,
    this.content,
  });

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
  Map<String, dynamic> toJson() => _$MessageToJson(this);

  @override
  String toString() => 'Message(role: $role, content: $content)';
}

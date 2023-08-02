// ignore_for_file: sort_constructors_first, depend_on_referenced_packages

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:openaimobile/config/enums/users.dart';

part 'message.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class Message {
  Message({
    this.role,
    this.content,
    this.success = true,
  });

  @HiveField(0)
  final UserEnum? role;
  @HiveField(1)
  final String? content;
  @HiveField(2)
  bool? success;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
  Map<String, dynamic> toJson() => _$MessageToJson(this);

  @override
  String toString() =>
      'Message(role: $role, content: $content  success:$success)';
}

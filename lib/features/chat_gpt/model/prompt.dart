// ignore_for_file: public_member_api_docs, sort_constructors_first

// ignore: depend_on_referenced_packages
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:openaimobile/config/enums/users.dart';
import 'package:openaimobile/features/chat_gpt/model/choice.dart';
import 'package:openaimobile/features/chat_gpt/model/message.dart';

part 'prompt.g.dart';

@HiveType(typeId: 2)
@JsonSerializable()
class PromptModel {
  PromptModel({
    this.id,
    this.created,
    this.model,
    this.choices,
  });

  @HiveField(0)
  final String? id;
  @HiveField(1)
  final int? created;
  @HiveField(2)
  final String? model;
  @HiveField(3)
  final List<Choice>? choices;

  factory PromptModel.fromJson(Map<String, dynamic> json) =>
      _$PromptModelFromJson(json);
  Map<String, dynamic> toJson() => _$PromptModelToJson(this);

  @override
  String toString() {
    return 'PromptModel(id: $id, created: $created, model: $model, choices: $choices)';
  }
}

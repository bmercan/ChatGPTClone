// ignore_for_file: public_member_api_docs, sort_constructors_first

// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:openaimobile/features/chat_gpt/model/choice.dart';
import 'package:openaimobile/features/chat_gpt/model/message.dart';

part 'prompt.g.dart';

enum UserEnum { user, assistant }

@JsonSerializable()
class PromptModel {
  String? id;
  int? created;
  String? model;
  List<Choice>? choices;
  PromptModel({
    this.id,
    this.created,
    this.model,
    this.choices,
  });

  factory PromptModel.fromJson(Map<String, dynamic> json) =>
      _$PromptModelFromJson(json);
  Map<String, dynamic> toJson() => _$PromptModelToJson(this);

  @override
  String toString() {
    return 'PromptModel(id: $id, created: $created, model: $model, choices: $choices)';
  }
}

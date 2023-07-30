// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prompt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PromptModel _$PromptModelFromJson(Map<String, dynamic> json) => PromptModel(
      id: json['id'] as String?,
      created: json['created'] as int?,
      model: json['model'] as String?,
      choices: (json['choices'] as List<dynamic>?)
          ?.map((e) => Choice.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PromptModelToJson(PromptModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created': instance.created,
      'model': instance.model,
      'choices': instance.choices,
    };

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      role: $enumDecodeNullable(_$UserEnumEnumMap, json['role']),
      content: json['content'] as String?,
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'role': _$UserEnumEnumMap[instance.role],
      'content': instance.content,
    };

const _$UserEnumEnumMap = {
  UserEnum.user: 'user',
  UserEnum.assistant: 'assistant',
};

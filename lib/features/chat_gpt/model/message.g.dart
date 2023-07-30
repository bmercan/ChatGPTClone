// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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

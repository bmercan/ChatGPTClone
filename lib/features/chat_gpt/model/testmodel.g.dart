// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'testmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveChatModelAdapter extends TypeAdapter<HiveChatModel> {
  @override
  final int typeId = 4;

  @override
  HiveChatModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveChatModel(
      title: fields[0] as String?,
      date: fields[1] as DateTime?,
      chat: (fields[2] as List?)?.cast<Message?>(),
    );
  }

  @override
  void write(BinaryWriter writer, HiveChatModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.chat);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveChatModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

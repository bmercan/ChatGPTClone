// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserEnumAdapter extends TypeAdapter<UserEnum> {
  @override
  final int typeId = 3;

  @override
  UserEnum read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return UserEnum.user;
      case 1:
        return UserEnum.assistant;
      default:
        return UserEnum.user;
    }
  }

  @override
  void write(BinaryWriter writer, UserEnum obj) {
    switch (obj) {
      case UserEnum.user:
        writer.writeByte(0);
        break;
      case UserEnum.assistant:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserEnumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

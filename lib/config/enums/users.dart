import 'package:hive/hive.dart';

part 'users.g.dart';

@HiveType(typeId: 3)
enum UserEnum {
  @HiveField(0)
  user('user'),
  @HiveField(1)
  assistant('assistant');

  const UserEnum(this.value);
  final String value;

  String get toImage => 'assets/avatars/$value.png';
  String get toName => value.toUpperCase();
}

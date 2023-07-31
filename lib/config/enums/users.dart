enum UserEnum {
  user('user'),
  assistant('assistant');

  const UserEnum(this.value);
  final String value;

  String get toImage => 'assets/avatars/$value.png';
  String get toName => value.toUpperCase();
}

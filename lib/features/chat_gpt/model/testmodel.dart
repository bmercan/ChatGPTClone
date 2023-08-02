import 'package:hive/hive.dart';
import 'package:openaimobile/features/chat_gpt/model/message.dart';
import 'package:json_annotation/json_annotation.dart';

part 'testmodel.g.dart';

@HiveType(typeId: 4)
class HiveChatModel {
  HiveChatModel({this.title, this.date, this.chat});
  @HiveField(0)
  String? title;
  @HiveField(1)
  DateTime? date;
  @HiveField(2)
  List<Message?>? chat;
}

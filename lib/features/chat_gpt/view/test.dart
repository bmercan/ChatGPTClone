import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hive/hive.dart';
import 'package:openaimobile/config/constants/app_constants.dart';
import 'package:openaimobile/config/enums/users.dart';
import 'package:openaimobile/features/chat_gpt/model/message.dart';
import 'package:openaimobile/features/chat_gpt/model/testmodel.dart';
import 'package:openaimobile/features/chat_gpt/widget/chat.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final _messageHistoryBox = Hive.box<HiveChatModel>(AppConstants.chatBox);
  List<Message?> a = [
    Message(role: UserEnum.user, content: 'Merhaba'),
    Message(role: UserEnum.assistant, content: 'Merhaba Nasılsın'),
    Message(role: UserEnum.user, content: 'Bana 10 kelimelik Metin YAz'),
    Message(role: UserEnum.assistant, content: '1,2,3,4,5,6,7'),
  ];
  List<Message?> _b = [
    Message(role: UserEnum.user, content: 'Merhaba2'),
    Message(role: UserEnum.assistant, content: 'Merhaba Nasılsın'),
    Message(role: UserEnum.user, content: 'Bana 10 kelimelik Metin YAz'),
    Message(role: UserEnum.assistant, content: '1,2,3,4,5,6,7'),
  ];

  HiveChatModel t1 = HiveChatModel(
    date: DateTime.now(),
    title: 'test123',
    chat: [
      Message(role: UserEnum.user, content: 'Merhaba'),
      Message(role: UserEnum.assistant, content: 'Merhaba Nasılsın'),
      Message(role: UserEnum.user, content: 'Bana 10 kelimelik Metin YAz'),
      Message(role: UserEnum.assistant, content: '1,2,3,4,5,6,7'),
    ],
  ); /* 
  TestModel t2 = TestModel(
    id: "2",
    messages: [
      Message(role: UserEnum.user, content: 'Merhaba2'),
      Message(role: UserEnum.assistant, content: 'Merhaba Nasılsın'),
      Message(role: UserEnum.user, content: 'Bana 10 kelimelik Metin YAz'),
      Message(role: UserEnum.assistant, content: '1,2,3,4,5,6,7'),
    ],
  ); */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        try {
          //_messageHistoryBox.add(t1);
          // _messageHistoryBox.clear();
          print(_messageHistoryBox.values.length);
          print(_messageHistoryBox.keys);
          /* var list =
              _messageHistoryBox.values.map((e) => e.cast<Message?>()).toList(); */

          // _messageHistoryBox.put('session2', t2);

          /*   List<dynamic> myList = _messageHistoryBox.values.toList()[1];
          print(myList); */
          //print(_messageHistoryBox.values.toList()[0]);
        } catch (e) {
          print(e);
        }
      }),
      backgroundColor: Colors.red,
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: _messageHistoryBox.values
            .elementAt(1)
            .chat
            ?.length, // _messageHistoryBox.values.first.length,
        itemBuilder: (BuildContext context, int index) {
          var message = _messageHistoryBox.values.elementAt(1).chat?[index];
          return ListTile(
            subtitle: Text(_messageHistoryBox.values.elementAt(1).title ?? ''),
            title: Text(
              message?.content ??
                  '', //_messageHistoryBox.values.toList()[index][index]?.content ?? '',
            ),
          );
        },
      ),
    );
  }
}

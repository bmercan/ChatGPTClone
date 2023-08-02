import 'package:flutter/material.dart';

import 'package:hive/hive.dart';
import 'package:openaimobile/config/constants/app_constants.dart';
import 'package:openaimobile/config/enums/users.dart';
import 'package:openaimobile/features/chat_gpt/model/message.dart';
import 'package:openaimobile/features/chat_gpt/model/testmodel.dart';
import 'package:openaimobile/features/chat_gpt/provider/prompt_provider.dart';
import 'package:openaimobile/features/chat_gpt/view/home.dart';
import 'package:provider/provider.dart';

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
  String selectedItem = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: PopupMenuButton(
        onSelected: (value) {
          /*  // your logic
          setState(() {
            selectedItem = value.toString();
          });
          print(value); */
          _showModalBottomSheet(context);
        },
        itemBuilder: (BuildContext bc) {
          return [
            /*  CustomPopupMenuItem(
              
              child: Row(
                children: [Text('New Chat'), Icon(Icons.add)],
              ),
            ),
            CustomPopupMenuItem(
              child: Row(
                children: [Text('History'), Icon(Icons.history)],
              ),
            ), */
          ];
        },
      ),
      backgroundColor: Colors.pink,
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: _messageHistoryBox.length,
        itemBuilder: (context, index) {
          final messages = _messageHistoryBox.values.toList();
          return ListTile(
            onTap: () {
              //_showModalBottomSheet(context);
            },
            title: Text(messages[index].title ?? ''),
            subtitle: Text(messages[index].chat?.last?.content ?? ''),
          );
        },
      ),
    );
  }

  Future<dynamic> _showModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          height: MediaQuery.of(context).size.height * .75, // 0.5, //0,75,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: ListView.builder(
            itemCount: _messageHistoryBox.length,
            itemBuilder: (context, index) {
              final messages = _messageHistoryBox.values.toList();
              return ListTile(
                title: Text(messages[index].title ?? ''),
                subtitle: Text(messages[index].chat?.last?.content ?? ''),
              );
            },
          ),
        ),
      ),
    );
  }

  Scaffold scaffold1(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          try {
            context.read<PromptProvider>().newSession();
            //_messageHistoryBox.add(t1);
            // _messageHistoryBox.clear();
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<PromptProvider>(
              builder: (context, value, child) {
                return Center(
                  child: Text(value.sessionName ?? 'Empty'),
                );
              },
            ),
            TextField(
              onSubmitted: (val) {
                //print(val);
                context.read<PromptProvider>().sessionName = val;
                // context.read<PromptProvider>().newSession();
              },
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<PromptProvider>().sessionName = 'N';
                },
                child: Text('New Session')),
          ],
        ) /* ListView.builder(
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
    ),*/
        );
  }
}

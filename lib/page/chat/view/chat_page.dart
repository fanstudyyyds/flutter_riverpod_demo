import 'package:flutter/material.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

final _user = const types.User(id: '555', firstName: "赵六5");

List<types.Message> _messages = [
  const types.TextMessage(
      author: types.User(id: '111', firstName: "张山"), id: '1', text: '卧槽'),
  const types.TextMessage(
      author: types.User(id: '111', firstName: "张山"), id: '11', text: '卧槽'),
  const types.TextMessage(
      author: types.User(id: '111', firstName: "张山"), id: '12', text: '卧槽'),
  const types.TextMessage(
      author: types.User(id: '111', firstName: "张山"), id: '13', text: '卧槽'),
  const types.TextMessage(
      author: types.User(id: '111', firstName: "张山"), id: '14', text: '卧槽'),
  const types.TextMessage(
      author: types.User(id: '111', firstName: "张山"), id: '15', text: '卧槽'),
  const types.TextMessage(
      author: types.User(id: '111', firstName: "张山"), id: '16', text: '卧槽'),
  const types.TextMessage(
      author: types.User(id: '111', firstName: "张山"), id: '17', text: '卧槽'),
  const types.TextMessage(
      author: types.User(id: '111', firstName: "张山"), id: '18', text: '卧槽'),
  const types.TextMessage(
      author: types.User(id: '111', firstName: "张山"), id: '19', text: '卧槽'),
  const types.TextMessage(
      author: types.User(id: '111', firstName: "张山"), id: '188', text: '卧槽'),
  const types.TextMessage(
      author: types.User(id: '111', firstName: "张山"), id: '189', text: '卧槽'),
  const types.TextMessage(
      author: types.User(id: '222', firstName: "李四"), id: '2', text: '111'),
  types.TextMessage(
      showStatus: false,
      createdAt:
          DateTime.now().subtract(Duration(minutes: 30)).millisecondsSinceEpoch,
      author: types.User(id: '333', firstName: "王五"),
      id: '3',
      text: '王五'),
  types.TextMessage(
      showStatus: true,
      createdAt:
          DateTime.now().subtract(Duration(minutes: 22)).millisecondsSinceEpoch,
      author: types.User(id: '444', firstName: "赵六"),
      id: '4',
      text: '赵六'),
  types.TextMessage(
      showStatus: true,
      createdAt:
          DateTime.now().subtract(Duration(minutes: 22)).millisecondsSinceEpoch,
      author: types.User(id: '555', firstName: "赵六5"),
      id: '54',
      text: '这个是什么'),
  types.ImageMessage(
      author: types.User(id: '555', firstName: "赵六5"),
      id: '4',
      name: '',
      size: 10,
      createdAt:
          DateTime.now().subtract(Duration(minutes: 1)).millisecondsSinceEpoch,
      uri:
          'http://192.168.1.31:8080/assetImg/20250902-100332-76-1807051927-76-210-detectImg-patrol.jpg')
];

class ChatPage extends ConsumerWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
        ),
        body: Chat(
          messages: _messages,
          onSendPressed: (PartialText) {},
          showUserAvatars: true,
          showUserNames: true,
          user: _user,
        ));
  }
}

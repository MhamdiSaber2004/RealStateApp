import 'package:flutter/material.dart';
import 'package:flutterfront/features/chats/data/single_chat_data.dart';
import 'package:flutterfront/features/chats/widgets/my_message_widget.dart';
import 'package:flutterfront/features/chats/widgets/other_massege_wigdet.dart';

class ListMessagesWidget extends StatefulWidget {
  const ListMessagesWidget({super.key});

  @override
  State<ListMessagesWidget> createState() => _ListMessagesWidgetState();
}

class _ListMessagesWidgetState extends State<ListMessagesWidget> {

  final String currentUserId = "user123"; // agent id

  @override
  Widget build(BuildContext context) {
    final chat = dummyChats.first; // take first chat for example
    final messages = chat.messages;

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: messages.map((msg) {
            final isMe = msg.sender == currentUserId;

            if (isMe) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: MyMessageWidget(messages: msg.text),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: OtherMassegeWigdet(messages: msg.text),
              );
            }
          }).toList(),
        ),
      ),
    );
  }
}

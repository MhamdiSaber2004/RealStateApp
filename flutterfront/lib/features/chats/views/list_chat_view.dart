import 'package:flutter/material.dart';

class ListChatPage extends StatefulWidget {
  const ListChatPage({super.key});

  @override
  State<ListChatPage> createState() => _ListChatPageState();
}

class _ListChatPageState extends State<ListChatPage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("chats"));
  }
}

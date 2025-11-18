import 'package:flutter/material.dart';
import 'package:flutterfront/features/chats/widgets/list_chats_widgets.dart';

class ListChatPage extends StatefulWidget {
  const ListChatPage({super.key});

  @override
  State<ListChatPage> createState() => _ListChatPageState();
}

class _ListChatPageState extends State<ListChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            ListChatsWidgets()
          ],
        ),
      )
    );
  }
}

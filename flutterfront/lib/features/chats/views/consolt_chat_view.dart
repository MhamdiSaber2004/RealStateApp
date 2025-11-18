import 'package:flutter/material.dart';
import 'package:flutterfront/core/constants/app_colors.dart';
import 'package:flutterfront/features/chats/widgets/list_messages_widget.dart';

class ConsoltChatPage extends StatefulWidget {
  const ConsoltChatPage({super.key});

  @override
  State<ConsoltChatPage> createState() => _ConsoltChatPageState();
}

class _ConsoltChatPageState extends State<ConsoltChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondary,
        title: const Text("Chat Conversation"),
      ),
      body: CustomScrollView(
         slivers: [
            ListMessagesWidget(),

        ],
      ),

      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Write a message...",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(width: 10),
            IconButton(onPressed: (){}, icon: Icon(Icons.send, color: Colors.blue , fontWeight: FontWeight.bold,),)
          ],
        ),
      ),

    
    );
  }
}
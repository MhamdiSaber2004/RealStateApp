import 'package:flutter/material.dart';
import 'package:flutterfront/features/chats/data/chats_data.dart';
import 'package:flutterfront/features/chats/views/consolt_chat_view.dart';
class ListChatsWidgets extends StatefulWidget {
  const ListChatsWidgets({super.key});

  @override
  State<ListChatsWidgets> createState() => _ListChatsWidgetsState();
}

class _ListChatsWidgetsState extends State<ListChatsWidgets> {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(16),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final chat = chats[index];
            final lastMessage = chat.messages.isNotEmpty
                ? chat.messages.last
                : null;

            return Card(
              margin: const EdgeInsets.symmetric(vertical: 6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 1,
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://via.placeholder.com/150'), // avatar agent/client
                ),
                title: Text(
                  chat.participants[0],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Text(
                  lastMessage != null ? lastMessage.text : "No messages yet",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Text(
                  lastMessage?.createdAt != null
                      ? "${lastMessage!.createdAt!.hour.toString().padLeft(2, '0')}:${lastMessage.createdAt!.minute.toString().padLeft(2, '0')}"
                      : "",
                  style: const TextStyle(color: Colors.grey),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConsoltChatPage(),
                    ),
                  );
                },
              ),
            );
          },
          childCount: chats.length,
        ),
      ),
    );
  }
}

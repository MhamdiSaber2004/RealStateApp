import 'package:flutterfront/models/chatModel.dart';

final List<Chat> dummyChats = [
  Chat(
    id: "chat001",
    participants: ["user123", "user456"],
    messages: [
      Message(
        sender: "user123",
        text: "Hello! I'm here to help you find your dream house 🏠",
        createdAt: DateTime.now().subtract(const Duration(minutes: 10)),
      ),
      Message(
        sender: "user456",
        text: "Thanks! I'm looking for a 3-bedroom apartment near downtown.",
        createdAt: DateTime.now().subtract(const Duration(minutes: 8)),
      ),
      Message(
        sender: "user123",
        text: "Perfect! I have a few listings that match your criteria.",
        createdAt: DateTime.now().subtract(const Duration(minutes: 6)),
      ),
      Message(
        sender: "user456",
        text: "Awesome! Can you share some details?",
        createdAt: DateTime.now().subtract(const Duration(minutes: 4)),
      ),
      Message(
        sender: "user123",
        text: "Sure! Here's one located near Avenue Habib Bourguiba 🌇",
        createdAt: DateTime.now().subtract(const Duration(minutes: 2)),
      ),
    ],
    createdAt: DateTime.now().subtract(const Duration(days: 1)),
    updatedAt: DateTime.now(),
  ),
];


import 'package:flutterfront/models/chatModel.dart';

final List<Chat> chats = [
  Chat(
    id: "chat001",
    participants: [
      "user123", // agent id
      "user456", // client id
    ],
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
        text: "Sure! Here's one located near Avenue Habib Bourguiba, great view too 🌇",
        createdAt: DateTime.now().subtract(const Duration(minutes: 2)),
      ),
    ],
    createdAt: DateTime.now().subtract(const Duration(days: 1)),
    updatedAt: DateTime.now(),
  ),
  Chat(
    id: "chat002",
    participants: [
      "user789", // another agent
      "user456", // same client
    ],
    messages: [
      Message(
        sender: "user789",
        text: "Hi! Are you still looking for a rental property?",
        createdAt: DateTime.now().subtract(const Duration(hours: 2)),
      ),
      Message(
        sender: "user456",
        text: "Yes, but I prefer something modern with a balcony.",
        createdAt: DateTime.now().subtract(const Duration(hours: 1, minutes: 40)),
      ),
    ],
    createdAt: DateTime.now().subtract(const Duration(days: 2)),
    updatedAt: DateTime.now(),
  ),
];

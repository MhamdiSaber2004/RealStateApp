class  Chat {
  final String id;
  final List<String> participants; // user ids
  final List<Message> messages;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Chat({
    required this.id,
    required this.participants,
    required this.messages,
    this.createdAt,
    this.updatedAt,
  });

  // ✅ JSON → Chat
  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      id: json['_id'] ?? '',
      participants: json['participants'] != null
          ? List<String>.from(json['participants'].map((x) => x.toString()))
          : [],
      messages: json['messages'] != null
          ? List<Message>.from(
              json['messages'].map((x) => Message.fromJson(x)),
            )
          : [],
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.tryParse(json['updatedAt'])
          : null,
    );
  }

  // ✅ Chat → JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'participants': participants,
      'messages': messages.map((m) => m.toJson()).toList(),
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}

class Message {
  final String sender;
  final String text;
  final DateTime? createdAt;

  Message({
    required this.sender,
    required this.text,
    this.createdAt,
  });

  // ✅ JSON → Message
  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      sender: json['sender'] ?? '',
      text: json['text'] ?? '',
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'])
          : null,
    );
  }

  // ✅ Message → JSON
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'text': text,
      'createdAt': createdAt?.toIso8601String(),
    };
  }
}

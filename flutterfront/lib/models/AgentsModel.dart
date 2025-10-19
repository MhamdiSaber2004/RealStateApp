class Agent {
  final String id;
  final String name;
  final String email;
  final String avatar;
  final String phoneNumber;
  final String role; // should always be "agent"
  final String? bio;
  final List<String>? propertyIds;
  final List<String>? chatIds;
  final bool verified;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Agent({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
    required this.phoneNumber,
    this.role = "agent",
    this.bio,
    this.propertyIds,
    this.chatIds,
    this.verified = false,
    this.createdAt,
    this.updatedAt,
  });

  // ✅ Convert JSON → Agent
  factory Agent.fromJson(Map<String, dynamic> json) {
    return Agent(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      avatar: json['avatar'],
      phoneNumber: json['phoneNumber'],
      role: json['role'] ?? 'agent',
      bio: json['bio'],
      propertyIds: json['properties'] != null
          ? List<String>.from(json['properties'].map((x) => x.toString()))
          : [],
      chatIds: json['chats'] != null
          ? List<String>.from(json['chats'].map((x) => x.toString()))
          : [],
      verified: json['verified'] ?? false,
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.tryParse(json['updatedAt'])
          : null,
    );
  }

  // ✅ Convert Agent → JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'avatar': avatar,
      'phoneNumber': phoneNumber,
      'role': role,
      'bio': bio,
      'properties': propertyIds,
      'chats': chatIds,
      'verified': verified,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}

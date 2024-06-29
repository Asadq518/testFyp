class Message {
  final String role;
  final String content;

  Message(this.role, this.content);

  Map<String, dynamic> toJson() {
    return {
      'role': role,
      'content': content,
    };
  }

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      json['role'] as String,
      json['content'] as String,
    );
  }
}

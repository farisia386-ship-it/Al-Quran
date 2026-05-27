enum MessageType { text, loading, suggestion, error }
enum MessageSender { user, ai }

class AiChatMessage {
  final String id;
  final String text;
  final MessageSender sender;
  final MessageType type;
  final DateTime timestamp;
  final String? category;
  final Map<String, dynamic>? metadata;

  AiChatMessage({
    required this.id,
    required this.text,
    required this.sender,
    this.type = MessageType.text,
    DateTime? timestamp,
    this.category,
    this.metadata,
  }) : timestamp = timestamp ?? DateTime.now();

  AiChatMessage copyWith({
    String? id,
    String? text,
    MessageSender? sender,
    MessageType? type,
    DateTime? timestamp,
    String? category,
    Map<String, dynamic>? metadata,
  }) {
    return AiChatMessage(
      id: id ?? this.id,
      text: text ?? this.text,
      sender: sender ?? this.sender,
      type: type ?? this.type,
      timestamp: timestamp ?? this.timestamp,
      category: category ?? this.category,
      metadata: metadata ?? this.metadata,
    );
  }
}

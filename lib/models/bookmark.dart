class Bookmark {
  final int timestamp;
  final String description;

  Bookmark({required this.timestamp, required this.description});

  factory Bookmark.fromJson(Map<String, dynamic> json) {
    return Bookmark(
      timestamp: json['timestamp'] ?? 0,
      description: json['description'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'timestamp': timestamp,
      'description': description,
    };
  }
}

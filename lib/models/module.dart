class Module {
  final String title;
  final String description;

  Module({required this.title, required this.description});

  factory Module.fromJson(Map<String, dynamic> json) {
    return Module(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
    );
  }

  get isCompleted => null;

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
    };
  }
}

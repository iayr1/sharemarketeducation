import 'package:edtech_app/models/module.dart';

class Course {
  final String id;
  final String courseTitle;
  final String courseDescription;
  final String videoUrl;
  final List<Module> modules;

  Course({
    required this.id,
    required this.courseTitle,
    required this.courseDescription,
    required this.videoUrl,
    required this.modules,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    List<dynamic> modulesData = json['modules'] ?? [];
    List<Module> modules =
    modulesData.map((module) => Module.fromJson(module)).toList();

    return Course(
      id: json['id'] ?? '',
      courseTitle: json['courseTitle'] ?? '',
      courseDescription: json['courseDescription'] ?? '',
      videoUrl: json['videoUrl'] ?? '',
      modules: modules,
    );
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> modulesData =
    modules.map((module) => module.toJson()).toList();

    return {
      'id': id,
      'courseTitle': courseTitle,
      'courseDescription': courseDescription,
      'videoUrl': videoUrl,
      'modules': modulesData,
    };
  }
}

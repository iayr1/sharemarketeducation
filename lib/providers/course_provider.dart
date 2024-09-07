import 'package:flutter/material.dart';
import 'package:edtech_app/models/course.dart';

class CourseProvider extends ChangeNotifier {
  List<Course> _enrolledCourses = [];

  List<Course> get enrolledCourses => _enrolledCourses;

  void addEnrolledCourse(Course course) {
    _enrolledCourses.add(course);
    notifyListeners();
  }

  void removeEnrolledCourse(Course course) {
    _enrolledCourses.remove(course);
    notifyListeners();
  }

  bool isCourseCompleted(Course course) {
    // Add your logic to determine if the course is completed
    // For example, you can check if all modules are completed
    bool allModulesCompleted = course.modules.every((module) => module.isCompleted);

    // Return true if all modules are completed, indicating the course is completed
    return allModulesCompleted;
  }

// Add other methods as needed for managing course-related data
}

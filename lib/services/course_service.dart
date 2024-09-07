import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edtech_app/models/course.dart';

class CourseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Get a list of all courses
  Future<List<Course>> getAllCourses() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('courses').get();
      List<Course> courses = querySnapshot.docs.map((doc) {
        return Course.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
      return courses;
    } catch (e) {
      print("Error getting all courses: $e");
      return [];
    }
  }

  // Get a specific course by ID
  Future<Course?> getCourseById(String courseId) async {
    try {
      DocumentSnapshot documentSnapshot =
      await _firestore.collection('courses').doc(courseId).get();
      if (documentSnapshot.exists) {
        return Course.fromJson(documentSnapshot.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    } catch (e) {
      print("Error getting course by ID: $e");
      return null;
    }
  }
}

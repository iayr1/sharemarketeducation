import 'package:edtech_app/models/course.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/dashboard_screen_course_card.dart';
import 'course_player_screen.dart';

class EnrolledCoursesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Course dartCourse = Course(
      id: '1',
      courseTitle: 'Learn Dart and Flutter',
      courseDescription: 'Description for Dart and Flutter course',
      videoUrl: 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
      modules: [],
    );

    Course pythonCourse = Course(
      id: '2',
      courseTitle: 'Learn Python',
      courseDescription: 'Description for Python course',
      videoUrl: 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
      modules: [],
    );

    Course javaCourse = Course(
      id: '3',
      courseTitle: 'Learn Java',
      courseDescription: 'Description for Java course',
      videoUrl: 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
      modules: [],
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20,
            color: Colors.black45,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Courses',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              CustomContainer(
                title: 'Learn Dart and Flutter',
                buttonText: 'Continue Course',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CoursePlayerScreen(course: dartCourse),
                    ),
                  );
                },
              ),
              CustomContainer(
                title: 'Learn Python',
                buttonText: 'Continue Course',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CoursePlayerScreen(course: pythonCourse),
                    ),
                  );
                },
              ),
              CustomContainer(
                title: 'Learn Java',
                buttonText: 'Continue Course',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CoursePlayerScreen(course: javaCourse),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

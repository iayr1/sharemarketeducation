import 'package:flutter/material.dart';
import 'package:edtech_app/models/course.dart';
import 'package:edtech_app/screens/widgets/module_list.dart';
import 'package:edtech_app/screens/widgets/bookmark_list.dart';

class CoursePlayerScreen extends StatefulWidget {
  final Course course;

  const CoursePlayerScreen({super.key, required this.course});

  @override
  _CoursePlayerScreenState createState() => _CoursePlayerScreenState();
}

class _CoursePlayerScreenState extends State<CoursePlayerScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.course.courseTitle),
        backgroundColor: Colors.blue, // Adjust color based on your theme
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: [
                // Placeholder for Video Playback UI
                Container(
                  color: Colors.black,
                  child: const Center(
                    child: Text(
                      'Video Playback UI',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                // Module list UI goes here
                ModuleListWidget(modules: widget.course.modules),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _pageController.previousPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: const Text('Previous'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: const Text('Next'),
                ),
              ],
            ),
          ),
          if (_currentPage == 0) ...[
            // Bookmark button and list UI goes here
            ElevatedButton(
              onPressed: () {
                // Handle bookmark logic
              },
              child: const Text('Bookmark'),
            ),
            const BookmarkListWidget(bookmarks: []),
          ],
          if (_currentPage == 1) ...[
            ElevatedButton(
              onPressed: () {
                // Show completion message
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Congratulations!'),
                      content: const Text('You have completed the course. Claim your certificate.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            // Navigate to the dashboard
                            Navigator.pushNamed(context, '/dashboard');
                          },
                          child: const Text('Claim Certificate'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Check Completion'),
            ),
          ],
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFab8e63), size: 30),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Courses',
          style: TextStyle(
            color: Color(0xFFab8e63),
            fontWeight: FontWeight.bold,
            fontSize: 24,
            shadows: [
              Shadow(blurRadius: 5, color: Colors.black, offset: Offset(2, 2))
            ],
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black, Colors.grey[900]!],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          children: [
            buildCourseCard(
              title: "Startup Trader",
              description: "Learn the basics of trading and start your journey in the trading world.",
              imageUrl: 'assets/startup_trader.jpg',
            ),
            buildCourseCard(
              title: "Advanced Trader",
              description: "Deep dive into advanced trading strategies and techniques.",
              imageUrl: 'assets/advanced_trader.jpg',
            ),
            buildCourseCard(
              title: "Professional Trader",
              description: "Master professional trading tactics and elevate your trading skills.",
              imageUrl: 'assets/professional_trader.jpg',
            ),
            buildCourseCard(
              title: "Expert Trader",
              description: "Become an expert with in-depth strategies and market analysis.",
              imageUrl: 'assets/expert_trader.jpg',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCourseCard({required String title, required String description, required String imageUrl}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: Colors.grey[850],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/placeholder.png',
              image: imageUrl,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0xFFab8e63),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              description,
              style: TextStyle(
                color: Colors.grey[300],
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Navigate to course details screen
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFab8e63),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'View Details',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

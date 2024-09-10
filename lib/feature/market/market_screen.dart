import 'package:flutter/material.dart';

class MarketScreen extends StatelessWidget {
  const MarketScreen({super.key});

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
          'Recorded Sessions',
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
            buildRecordedSessionCard(
              title: "Introduction to Trading",
              description: "A comprehensive introduction to trading basics.",
              imageUrl: 'assets/recorded1.jpg',
              duration: "1h 15m",
            ),
            buildRecordedSessionCard(
              title: "Technical Analysis",
              description: "Learn about technical analysis tools and strategies.",
              imageUrl: 'assets/recorded2.jpg',
              duration: "2h 30m",
            ),
            buildRecordedSessionCard(
              title: "Market Trends and Forecasting",
              description: "Understand market trends and forecasting techniques.",
              imageUrl: 'assets/recorded3.jpg',
              duration: "1h 45m",
            ),
            // Add more recorded sessions here
          ],
        ),
      ),
    );
  }

  Widget buildRecordedSessionCard({
    required String title,
    required String description,
    required String imageUrl,
    required String duration,
  }) {
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: Text(
              duration,
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 14,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Navigate to the recorded session details or play the recording
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFab8e63),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Watch Now',
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

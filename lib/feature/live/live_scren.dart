import 'package:flutter/material.dart';

class LiveScreen extends StatelessWidget {
  const LiveScreen({super.key});

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
          'Live Sessions',
          style: TextStyle(
            color: Color(0xFFab8e63),
            fontWeight: FontWeight.bold,
            fontSize: 24,
            shadows: [
              Shadow(blurRadius: 5, color: Colors.black, offset: Offset(2, 2))
            ],
          ),
        ),),
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
            buildLiveSessionCard(
              title: "Live Trading Session: Basics",
              description: "Join us for a live session where we cover the basics of trading.",
              imageUrl: 'assets/live_session1.jpg',
              date: "Sept 15, 2024 - 6:00 PM",
            ),
            buildLiveSessionCard(
              title: "Advanced Trading Strategies",
              description: "Dive deep into advanced trading strategies with our expert.",
              imageUrl: 'assets/live_session2.jpg',
              date: "Sept 20, 2024 - 8:00 PM",
            ),
            buildLiveSessionCard(
              title: "Market Analysis and Trends",
              description: "Learn how to analyze market trends in real-time.",
              imageUrl: 'assets/live_session3.jpg',
              date: "Sept 25, 2024 - 7:00 PM",
            ),
            // Add more live sessions here
          ],
        ),
      ),
    );
  }

  Widget buildLiveSessionCard({
    required String title,
    required String description,
    required String imageUrl,
    required String date,
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
              date,
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
                // Navigate to live session details or join the session
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFab8e63),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Join Now',
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

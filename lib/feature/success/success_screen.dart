import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

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
          'Success Stories',
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
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            buildSuccessStoryCard(
              title: "John Doe's Amazing Journey",
              description: "John Doe went from beginner to expert trader in just 6 months.",
              imageUrl: 'assets/success1.jpg',
            ),
            buildSuccessStoryCard(
              title: "Jane Smith's Trading Triumph",
              description: "Jane Smith achieved financial freedom through strategic trading.",
              imageUrl: 'assets/success2.jpg',
            ),
            buildSuccessStoryCard(
              title: "Robert Brown's Market Mastery",
              description: "Robert Brown turned his trading hobby into a successful career.",
              imageUrl: 'assets/success3.jpg',
            ),
            // Add more success stories here
          ],
        ),
      ),
    );
  }

  Widget buildSuccessStoryCard({
    required String title,
    required String description,
    required String imageUrl,
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
            child: ElevatedButton(
              onPressed: () {
                // Navigate to more details about the success story
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFab8e63),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Read More',
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

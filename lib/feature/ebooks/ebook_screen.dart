import 'package:flutter/material.dart';

class EbooksScreen extends StatelessWidget {
  const EbooksScreen({super.key});

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
          'E-books',
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
            buildEbookCard(
              title: "Fundamentals of Trading",
              author: "John Doe",
              imageUrl: 'assets/ebook1.jpg',
              description: "An introductory guide to the fundamentals of trading.",
            ),
            buildEbookCard(
              title: "Advanced Trading Strategies",
              author: "Jane Smith",
              imageUrl: 'assets/ebook2.jpg',
              description: "In-depth strategies for advanced traders.",
            ),
            buildEbookCard(
              title: "Technical Analysis Explained",
              author: "Robert Brown",
              imageUrl: 'assets/ebook3.jpg',
              description: "A comprehensive guide to technical analysis in trading.",
            ),
            // Add more e-books here
          ],
        ),
      ),
    );
  }

  Widget buildEbookCard({
    required String title,
    required String author,
    required String imageUrl,
    required String description,
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
              "by $author",
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 16,
                fontStyle: FontStyle.italic,
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
                // Navigate to the e-book details or open the e-book
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFab8e63),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Read Now',
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

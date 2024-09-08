import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String title;
  final String buttonText;
  final VoidCallback onPressed;

  const CustomContainer({super.key, 
    required this.title,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0, // Custom width
      height: 134.0, // Custom height
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.blue, // Change this to your desired color
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.blue
                .withOpacity(0.5), // Change this to your desired glow color
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, 3), // Adjust the offset as needed
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18.0, color: Colors.white),
          ),
          const SizedBox(height: 2.0),
          ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.blue,
              backgroundColor: Colors.white, // Text color
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 12,
              ), // Button padding
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16), // Button border radius
              ),
              elevation: 14, // Button elevation
            ),
            child: Text(
              buttonText,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}



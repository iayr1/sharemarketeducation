import 'package:edtech_app/screens/dashboard/dashboard_courses_screen.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String title;
  final String buttonText;
  final VoidCallback onPressed;

  const CustomContainer({
    required this.title,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0, // Custom width
      height: 134.0, // Custom height
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.blue, // Change this to your desired color
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.blue
                .withOpacity(0.5), // Change this to your desired glow color
            spreadRadius: 5,
            blurRadius: 10,
            offset: Offset(0, 3), // Adjust the offset as needed
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18.0, color: Colors.white),
          ),
          SizedBox(height: 2.0),
          ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.blue,
              backgroundColor: Colors.white, // Text color
              padding: EdgeInsets.symmetric(
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
              style: TextStyle(
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



import 'package:flutter/material.dart';

Widget buildEducationTabButton(int index, String label, int selectedIndex, Function(int) onTap) {
  bool isSelected = index == selectedIndex;
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: ElevatedButton(
      onPressed: () => onTap(index),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: isSelected ? const Color(0xFFab8e63) : Colors.grey[850],
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: isSelected ? Colors.black : Colors.white,
        ),
      ),
    ),
  );
}

Widget buildEducationListView(String title) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          title,
          style: const TextStyle(
            color: Color(0xFFab8e63),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      const SizedBox(height: 10),
      SizedBox(
        height: 160,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              width: 220,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.grey[850],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'Education Item $index',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            );
          },
        ),
      ),
      const SizedBox(height: 20),
    ],
  );
}

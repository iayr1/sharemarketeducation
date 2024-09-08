import 'package:flutter/material.dart';
import 'package:edtech_app/models/module.dart';

class ModuleListWidget extends StatelessWidget {
  final List<Module> modules;

  const ModuleListWidget({super.key, required this.modules});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Modules',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.grey[200], // Adjust color based on your theme
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildModuleTile("Data Structures", "Learn about various data structures."),
              _buildModuleTile("Algorithms", "Explore fundamental algorithms."),
              // Add more predefined modules as needed
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: modules.length,
          itemBuilder: (context, index) {
            var module = modules[index];
            return ListTile(
              title: Text(module.title),
              subtitle: Text(module.description),
            );
          },
        ),
      ],
    );
  }

  Widget _buildModuleTile(String title, String description) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(description),
    );
  }
}

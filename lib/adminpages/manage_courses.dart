import 'package:flutter/material.dart';

class ManageCourses extends StatefulWidget {
  const ManageCourses({super.key});

  @override
  State<ManageCourses> createState() => _ManageCoursesScreenState();
}

class _ManageCoursesScreenState extends State<ManageCourses> {
  // 2. A hardcoded list of courses for demonstration

  final List<String> courses = ['Mathematics', 'Science', 'History', 'English'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Courses'),
      ),
      // We will replace this body with a ListView next
      body: const Center(
        child: Text('Course list will be displayed here.'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Logic to add a new course will go here
        },
        child: const Icon(Icons.add),
        tooltip: 'Add Course', // Provides a label on long-press
      ),
    );
  }
}
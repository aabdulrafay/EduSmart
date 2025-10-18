import 'package:flutter/material.dart';

class StudentCoursesView extends StatelessWidget {
  final Function(String)? onNavigateToEnroll;

  const StudentCoursesView({super.key, this.onNavigateToEnroll});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> courses = [
      {'course': 'Mobile App Development', 'teacher': 'Mr. Ali'},
      {'course': 'Database Systems', 'teacher': 'Ms. Fatima'},
      {'course': 'Software Engineering', 'teacher': 'Dr. Ahmed'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Courses'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
      ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: const Icon(Icons.book_outlined, color: Colors.blue),
              title: Text(course['course']!),
              subtitle: Text('Teacher: ${course['teacher']}'),
              trailing: ElevatedButton(
                onPressed: () {
                  onNavigateToEnroll?.call(course['course']!);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0A73B7),
                ),
                child: const Text('Enroll'),
              ),
            ),
          );
        },
      ),
    );
  }
}

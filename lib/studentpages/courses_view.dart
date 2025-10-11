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

    return ListView.builder(
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
              child: const Text('Enroll'),
            ),
          ),
        );
      },
    );
  }
}

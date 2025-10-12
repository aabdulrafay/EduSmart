import 'package:flutter/material.dart';
import 'package:edusmart/teacherpages/Result%20Screens/evaluate_criteria_screen.dart';

class TeacherCoursesScreen extends StatelessWidget {
  const TeacherCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> teacherCourses = [
      'Mobile Application Development',
      'Web Programming',
      'Database Systems',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Courses'),
      ),
      body: ListView.builder(
        itemCount: teacherCourses.length,
        itemBuilder: (context, index) {
          final course = teacherCourses[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              title: Text(course),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SetMarksCriteriaScreen(courseName: course),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

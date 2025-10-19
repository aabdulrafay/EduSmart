import 'package:flutter/material.dart';
import 'package:edusmart/teacherpages/Result%20Screens/evaluate_criteria_screen.dart';

class TeacherCoursesScreen extends StatelessWidget {
  const TeacherCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryBlue = Color(0xFF0A73B7);

    final List<String> teacherCourses = [
      'Mobile Application Development',
      'Web Programming',
      'Database Systems',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Courses'),
        backgroundColor: Colors.white,
        foregroundColor: primaryBlue,
        elevation: 1,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: teacherCourses.length,
          itemBuilder: (context, index) {
            final course = teacherCourses[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 3,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              child: ListTile(
                contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                leading: const Icon(Icons.book_outlined, color: primaryBlue),
                title: Text(
                  course,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing:
                const Icon(Icons.arrow_forward_ios, color: Colors.grey),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SetMarksCriteriaScreen(courseName: course),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
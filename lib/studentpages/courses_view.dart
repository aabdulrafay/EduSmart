import 'package:flutter/material.dart';

class StudentCoursesView extends StatelessWidget {
  final Function(String)? onViewDetails;

  const StudentCoursesView({super.key, this.onViewDetails});

  @override
  Widget build(BuildContext context) {
    const primaryBlue = Color(0xFF0A73B7);

    // Courses grouped by session
    final Map<String, List<Map<String, String>>> coursesBySession = {
      'Fall 2024': [
        {
          'course': 'Mobile App Development',
          'teacher': 'Mr. Ali',
          'seats': '12 / 30',
        },
        {
          'course': 'Database Systems',
          'teacher': 'Ms. Fatima',
          'seats': '28 / 30',
        },
      ],
      'Spring 2025': [
        {
          'course': 'Software Engineering',
          'teacher': 'Dr. Ahmed',
          'seats': '15 / 30',
        },
        {
          'course': 'Web Programming',
          'teacher': 'Mr. Bilal',
          'seats': '30 / 30',
        },
      ],
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Enrolled Courses'),
        backgroundColor: Colors.white,
        foregroundColor: primaryBlue,
        elevation: 1,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: coursesBySession.entries.map((sessionEntry) {
          final session = sessionEntry.key;
          final courses = sessionEntry.value;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Session Header
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  session,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: primaryBlue,
                  ),
                ),
              ),

              // Courses in the Session
              ...courses.map((course) {
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.book_outlined,
                        color: primaryBlue, size: 30),
                    title: Text(
                      course['course']!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Teacher: ${course['teacher']}'),
                        Text('Available Seats: ${course['seats']}',
                            style: const TextStyle(color: Colors.grey)),
                      ],
                    ),
                ),
                );
              }),
              const SizedBox(height: 20),
            ],
          );
        }).toList(),
      ),
    );
  }
}
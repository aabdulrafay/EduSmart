import 'package:flutter/material.dart';

class StudentGradesView extends StatelessWidget {
  final List<String> enrolledCourses;
  final bool resultsSubmitted;
  final Map<String, Map<String, dynamic>> resultsMap;

  const StudentGradesView({
    super.key,
    required this.enrolledCourses,
    required this.resultsSubmitted,
    required this.resultsMap,
  });

  @override
  Widget build(BuildContext context) {
    // Dummy data fallback (for testing)
    final courses = enrolledCourses.isEmpty
        ? ['Mobile App Development', 'Database Systems', 'Software Engineering']
        : enrolledCourses;

    final map = resultsMap.isEmpty
        ? {
      'Mobile App Development': {'marks': 88, 'grade': 'A'},
      'Database Systems': {'marks': 74, 'grade': 'B+'},
    }
        : resultsMap;

    if (courses.isEmpty) {
      return const Center(
        child: Text(
          'You have not enrolled in any courses yet.',
          style: TextStyle(fontSize: 16),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: resultsSubmitted
          ? ListView(
        children: [
          Row(
            children: const [
              Icon(Icons.grade_outlined, color: Colors.teal, size: 26),
              SizedBox(width: 8),
              Text('My Grades',
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 12),
          ...courses.map((course) {
            final result = map[course];
            if (result != null) {
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  leading: const Icon(Icons.school_outlined,
                      color: Colors.green),
                  title: Text(course,
                      style:
                      const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('Marks: ${result['marks']}'),
                  trailing: Text(result['grade'].toString(),
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              );
            } else {
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  leading: const Icon(Icons.school_outlined,
                      color: Colors.grey),
                  title: Text(course),
                  subtitle: const Text('Result: Pending'),
                  trailing: const Text('Pending',
                      style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold)),
                ),
              );
            }
          }).toList(),
        ],
      )
          : ListView(
        children: [
          const SizedBox(height: 8),
          const Text(
            'Results are not yet submitted by teachers.',
            style: TextStyle(fontSize: 16, color: Colors.redAccent),
          ),
          const SizedBox(height: 16),
          const Text('Your enrolled courses:',
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ...courses.map((c) {
            return ListTile(
              leading: const Icon(Icons.book_outlined),
              title: Text(c),
              trailing: const Text('Pending',
                  style: TextStyle(color: Colors.orange)),
            );
          }).toList(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class StudentGradesView extends StatelessWidget {
  final bool resultsSubmitted;
  final Map<String, Map<String, Map<String, dynamic>>> resultsBySession;

  const StudentGradesView({
    super.key,
    required this.resultsSubmitted,
    required this.resultsBySession,
  });

  // Grade Point Calculation
  double _getGradePoint(double marks) {
    if (marks >= 85) return 4.0;
    if (marks >= 75) return 3.5;
    if (marks >= 65) return 3.0;
    if (marks >= 55) return 2.5;
    if (marks >= 50) return 2.0;
    return 0.0;
  }

  // SGPA per session
  double _calculateSGPA(Map<String, Map<String, dynamic>> sessionCourses) {
    if (sessionCourses.isEmpty) return 0.0;
    double totalPoints = 0;
    for (var course in sessionCourses.values) {
      totalPoints += _getGradePoint(course['marks'].toDouble());
    }
    return totalPoints / sessionCourses.length;
  }

  // CGPA across sessions
  double _calculateCGPA(Map<String, Map<String, Map<String, dynamic>>> results) {
    int totalCourses = 0;
    double totalPoints = 0;
    for (var session in results.values) {
      for (var course in session.values) {
        totalPoints += _getGradePoint(course['marks'].toDouble());
        totalCourses++;
      }
    }
    return totalCourses == 0 ? 0.0 : totalPoints / totalCourses;
  }

  @override
  Widget build(BuildContext context) {
    const primaryBlue = Color(0xFF0A73B7);

    // Sample data if results not passed
    final data = resultsBySession.isEmpty
        ? {
      'Fall 2024': {
        'Mobile App Development': {'marks': 88, 'grade': 'A'},
        'Database Systems': {'marks': 74, 'grade': 'B+'},
      },
      'Spring 2025': {
        'Software Engineering': {'marks': 81, 'grade': 'A-'},
        'Web Programming': {'marks': 69, 'grade': 'B'},
      },
    }
        : resultsBySession;

    final cgpa = _calculateCGPA(data).toStringAsFixed(2);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Grades'),
        backgroundColor: Colors.white,
        foregroundColor: primaryBlue,
        elevation: 1,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: resultsSubmitted
            ? ListView(
          children: [
            // Overall CGPA
            Card(
              color: Colors.teal.shade50,
              elevation: 2,
              margin: const EdgeInsets.only(bottom: 16),
              child: ListTile(
                leading:
                const Icon(Icons.star, color: Colors.teal, size: 30),
                title: const Text(
                  'Overall CGPA',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Text(
                  cgpa,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.teal,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),

            // Show results by session
            ...data.entries.map((sessionEntry) {
              final sessionName = sessionEntry.key;
              final sessionCourses = sessionEntry.value;
              final sgpa =
              _calculateSGPA(sessionCourses).toStringAsFixed(2);

              return Card(
                margin: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Session title + SGPA
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            sessionName,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: primaryBlue,
                            ),
                          ),
                          Text(
                            'SGPA: $sgpa',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.teal,
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      const SizedBox(height: 4),
                      // List courses in that session
                      ...sessionCourses.entries.map((courseEntry) {
                        final courseName = courseEntry.key;
                        final course = courseEntry.value;
                        return ListTile(
                          leading: const Icon(Icons.book_outlined,
                              color: Colors.blue),
                          title: Text(
                            courseName,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle:
                          Text('Marks: ${course['marks'].toString()}'),
                          trailing: Text(
                            course['grade'].toString(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              );
            }),
          ],
        )
            : Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.hourglass_empty,
                  size: 60, color: Colors.redAccent),
              SizedBox(height: 16),
              Text(
                'Results are not yet published by teachers.',
                textAlign: TextAlign.center,
                style:
                TextStyle(fontSize: 16, color: Colors.redAccent),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class StudentEnrollmentView extends StatefulWidget {
  final String? initialCourse;
  final Function(String)? onEnrollmentSuccess;

  const StudentEnrollmentView({super.key, this.initialCourse, this.onEnrollmentSuccess});

  @override
  State<StudentEnrollmentView> createState() => _StudentEnrollmentViewState();
}

class _StudentEnrollmentViewState extends State<StudentEnrollmentView> {
  String? _selectedCourse;

  final List<Map<String, String>> availableCourses = [
    {
      'name': 'Mobile App Development',
      'instructor': 'Mr. Ali',
      'timing': 'Mon & Wed - 10:00 AM to 11:30 AM',
    },
    {
      'name': 'Database Systems',
      'instructor': 'Ms. Fatima',
      'timing': 'Tue & Thu - 12:00 PM to 1:30 PM',
    },
    {
      'name': 'Software Engineering',
      'instructor': 'Dr. Ahmed',
      'timing': 'Fri - 9:00 AM to 12:00 PM',
    },
  ];

  final List<Map<String, String>> enrolledCourses = [];

  @override
  void initState() {
    super.initState();
    _selectedCourse = widget.initialCourse;
  }

  void _enroll() {
    if (_selectedCourse != null &&
        !enrolledCourses.any((c) => c['name'] == _selectedCourse)) {
      final selected = availableCourses
          .firstWhere((course) => course['name'] == _selectedCourse);

      setState(() {
        enrolledCourses.add(selected);
      });

      widget.onEnrollmentSuccess?.call(_selectedCourse!);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Enrolled in $_selectedCourse successfully!')),
      );
    } else if (_selectedCourse != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('You are already enrolled in this course.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedDetails = availableCourses
        .firstWhere((c) => c['name'] == _selectedCourse,
        orElse: () => {'name': '', 'instructor': '', 'timing': ''});

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enroll in a Course',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: _selectedCourse,
              items: availableCourses
                  .map((course) => DropdownMenuItem(
                value: course['name'],
                child: Text(course['name']!),
              ))
                  .toList(),
              onChanged: (value) => setState(() => _selectedCourse = value),
              decoration: const InputDecoration(
                labelText: 'Select Course',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),
            if (_selectedCourse != null && selectedDetails['name']!.isNotEmpty)
              Card(
                elevation: 2,
                margin: const EdgeInsets.only(bottom: 20),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(selectedDetails['name']!,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Text('Instructor: ${selectedDetails['instructor']}'),
                      Text('Timing: ${selectedDetails['timing']}'),
                    ],
                  ),
                ),
              ),

            Center(
              child: ElevatedButton(
                onPressed: _enroll,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Confirm Enrollment'),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Enrolled Courses:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            if (enrolledCourses.isEmpty)
              const Text(
                'No courses enrolled yet.',
                style: TextStyle(color: Colors.grey),
              )
            else
              Column(
                children: enrolledCourses
                    .map(
                      (course) => Card(
                    child: ListTile(
                      leading:
                      const Icon(Icons.book, color: Colors.blueAccent),
                      title: Text(course['name']!,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Instructor: ${course['instructor']}'),
                          Text('Timing: ${course['timing']}'),
                        ],
                      ),
                    ),
                  ),
                )
                    .toList(),
              ),
          ],
        ),
      ),
    );
  }
}

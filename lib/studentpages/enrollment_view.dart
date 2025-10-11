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
  final List<String> availableCourses = [
    'Mobile App Development',
    'Database Systems',
    'Software Engineering',
  ];

  @override
  void initState() {
    super.initState();
    _selectedCourse = widget.initialCourse;
  }

  void _enroll() {
    if (_selectedCourse != null) {
      widget.onEnrollmentSuccess?.call(_selectedCourse!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
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
                .map((course) => DropdownMenuItem(value: course, child: Text(course)))
                .toList(),
            onChanged: (value) => setState(() => _selectedCourse = value),
            decoration: const InputDecoration(
              labelText: 'Select Course',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: _enroll,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Confirm Enrollment'),
            ),
          ),
        ],
      ),
    );
  }
}

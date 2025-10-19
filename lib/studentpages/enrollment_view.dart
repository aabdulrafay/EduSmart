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

  // List of available courses with instructor, timing, session, and available seats
  final List<Map<String, String>> availableCourses = [
    {
      'name': 'Mobile App Development',
      'instructor': 'Mr. Ali',
      'timing': 'Mon & Wed - 10:00 AM to 11:30 AM',
      'session': 'Fall 2023',
      'seats': '25',
    },
    {
      'name': 'Database Systems',
      'instructor': 'Ms. Fatima',
      'timing': 'Tue & Thu - 12:00 PM to 1:30 PM',
      'session': 'Spring 2024',
      'seats': '30',
    },
    {
      'name': 'Software Engineering',
      'instructor': 'Dr. Ahmed',
      'timing': 'Fri - 9:00 AM to 12:00 PM',
      'session': 'Fall 2024',
      'seats': '20',
    },
  ];

  // Enrolled courses grouped by session (Fall, Spring, etc.)
  final Map<String, List<Map<String, String>>> enrolledBySession = {};

  @override
  void initState() {
    super.initState();
    _selectedCourse = widget.initialCourse;
  }

  // Enroll student into selected course
  void _enroll() {
    if (_selectedCourse == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a course first.')),
      );
      return;
    }

    final selected = availableCourses.firstWhere(
          (course) => course['name'] == _selectedCourse,
    );

    final session = selected['session']!;

    // Check if already enrolled
    final alreadyEnrolled = enrolledBySession[session]
        ?.any((c) => c['name'] == _selectedCourse) ??
        false;

    if (alreadyEnrolled) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('You are already enrolled in this course.')),
      );
      return;
    }

    setState(() {
      enrolledBySession.putIfAbsent(session, () => []);
      enrolledBySession[session]!.add(selected);
    });

    widget.onEnrollmentSuccess?.call(_selectedCourse!);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Enrolled in $_selectedCourse successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    const primaryBlue = Color(0xFF0A73B7);

    final selectedDetails = availableCourses.firstWhere(
          (c) => c['name'] == _selectedCourse,
      orElse: () => {
        'name': '',
        'instructor': '',
        'timing': '',
        'session': '',
        'seats': '',
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Enrollment'),
        backgroundColor: Colors.white,
        foregroundColor: primaryBlue,
        elevation: 1,
        centerTitle: true,
      ),
      body: Padding(
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

              // Dropdown to select course
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

              // Selected course details card
              if (_selectedCourse != null && selectedDetails['name']!.isNotEmpty)
                Card(
                  elevation: 3,
                  margin: const EdgeInsets.only(bottom: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
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
                        Text('Session: ${selectedDetails['session']}'),
                        Text('Available Seats: ${selectedDetails['seats']}'),
                      ],
                    ),
                  ),
                ),

              // Enroll button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _enroll,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryBlue,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text(
                    'Confirm Enrollment',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                'Enrolled Courses by Session:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // No enrolled courses yet
              if (enrolledBySession.isEmpty)
                const Text(
                  'No courses enrolled yet.',
                  style: TextStyle(color: Colors.grey),
                )
              else
              // Display courses grouped by session
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: enrolledBySession.entries.map((entry) {
                    final session = entry.key;
                    final sessionCourses = entry.value;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Text(
                          session,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: primaryBlue,
                          ),
                        ),
                        const SizedBox(height: 6),
                        ...sessionCourses.map((course) {
                          return Card(
                            elevation: 2,
                            child: ListTile(
                              leading:
                              const Icon(Icons.book, color: primaryBlue),
                              title: Text(
                                course['name']!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Instructor: ${course['instructor']}'),
                                  Text('Timing: ${course['timing']}'),
                                  Text('Available Seats: ${course['seats']}'),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ],
                    );
                  }).toList(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
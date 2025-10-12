import 'package:flutter/material.dart';

class MarkAttendanceScreen extends StatefulWidget {
  const MarkAttendanceScreen({super.key});

  @override
  State<MarkAttendanceScreen> createState() => _MarkAttendanceScreenState();
}

class _MarkAttendanceScreenState extends State<MarkAttendanceScreen> {
  // Courses assigned to teacher
  final List<String> courses = [
    'Mobile Application Development',
    'Web Programming',
    'Data Structures',
    'Database Management Systems'
  ];

  // Class timings managed by Admin
  final Map<String, List<String>> classTimings = {
    'Mobile Application Development': ['09:00 AM - 10:00 AM', '03:00 PM - 04:00 PM'],
    'Web Programming': ['10:00 AM - 11:00 AM'],
    'Data Structures': ['11:00 AM - 12:00 PM', '02:00 PM - 03:00 PM'],
    'Database Management Systems': ['01:00 PM - 02:00 PM'],
  };

  // Dummy students list for each course
  final Map<String, List<String>> students = {
    'Mobile Application Development': ['Ali', 'Hassan', 'Sara'],
    'Web Programming': ['Usman', 'Rafay', 'Ayesha'],
    'Data Structures': ['Zain', 'Hiba', 'Ahmed'],
    'Database Management Systems': ['Hamza', 'Maha', 'Adeel'],
  };

  String? selectedCourse;
  String? selectedTiming;
  DateTime selectedDate = DateTime.now();
  Map<String, bool> studentAttendance = {}; // To store attendance marks

  // Attendance records (history)
  final List<Map<String, String>> attendanceRecords = [];

  // Select Date
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2024),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  // When course is selected
  void _onCourseChange(String? course) {
    setState(() {
      selectedCourse = course;
      selectedTiming = null;
      studentAttendance.clear();

      if (course != null && students.containsKey(course)) {
        for (var student in students[course]!) {
          studentAttendance[student] = false;
        }
      }
    });
  }

  // Submit Attendance
  void _submitAttendance() {
    if (selectedCourse == null || selectedTiming == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select course and timing')),
      );
      return;
    }

    // Current timestamp
    final submissionTime = DateTime.now().toLocal().toString().split('.')[0];

    setState(() {
      attendanceRecords.add({
        'course': selectedCourse!,
        'date': selectedDate.toLocal().toString().split(' ')[0],
        'time': selectedTiming!,
        'submittedAt': submissionTime,
      });

      // Reset attendance checkboxes after submission
      studentAttendance.updateAll((key, value) => false);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Attendance submitted for $selectedCourse\n'
              'Date: ${selectedDate.toLocal().toString().split(' ')[0]}\n'
              'Time: $selectedTiming\n'
              'Submitted At: $submissionTime',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final today = selectedDate.toLocal().toString().split(' ')[0];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mark Attendance'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Course Selection
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Select Course'),
              value: selectedCourse,
              items: courses
                  .map((course) =>
                  DropdownMenuItem(value: course, child: Text(course)))
                  .toList(),
              onChanged: _onCourseChange,
            ),

            const SizedBox(height: 16),

            // Date Selection
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Selected Date: $today'),
                ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: const Text('Select Date'),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Timing Selection (from admin-managed timings)
            if (selectedCourse != null)
              DropdownButtonFormField<String>(
                decoration:
                const InputDecoration(labelText: 'Select Class Timing'),
                value: selectedTiming,
                items: classTimings[selectedCourse]!
                    .map((timing) =>
                    DropdownMenuItem(value: timing, child: Text(timing)))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedTiming = value;
                  });
                },
              ),

            const SizedBox(height: 16),

            // Student List
            Expanded(
              child: selectedCourse == null
                  ? const Center(child: Text('Please select a course'))
                  : students[selectedCourse] == null ||
                  students[selectedCourse]!.isEmpty
                  ? const Center(child: Text('No students found'))
                  : ListView(
                children: students[selectedCourse]!
                    .map(
                      (student) => CheckboxListTile(
                    title: Text(student),
                    value: studentAttendance[student] ?? false,
                    onChanged: (bool? value) {
                      setState(() {
                        studentAttendance[student] = value!;
                      });
                    },
                  ),
                )
                    .toList(),
              ),
            ),

            const SizedBox(height: 8),

            // Submit Button
            Center(
              child: ElevatedButton(
                onPressed: _submitAttendance,
                child: const Text('Submit Attendance'),
              ),
            ),

            const SizedBox(height: 20),

            // Attendance Records List
            const Text(
              'Submitted Records:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: attendanceRecords.length,
                itemBuilder: (context, index) {
                  final record = attendanceRecords[index];
                  return ListTile(
                    title: Text(record['course']!),
                    subtitle: Text(
                      'Date: ${record['date']}\n'
                          'Time: ${record['time']}\n'
                          'Submitted At: ${record['submittedAt']}',
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

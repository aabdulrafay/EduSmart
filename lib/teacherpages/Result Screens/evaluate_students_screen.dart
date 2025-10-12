import 'package:flutter/material.dart';
import 'package:edusmart/teacherpages/Result Screens/teacher_courses_screen.dart';

class EvaluateStudentsScreen extends StatefulWidget {
  final String courseName;
  final List<Map<String, dynamic>> criteria;

  const EvaluateStudentsScreen({
    super.key,
    required this.courseName,
    required this.criteria,
  });

  @override
  State<EvaluateStudentsScreen> createState() => _EvaluateStudentsScreenState();
}

class _EvaluateStudentsScreenState extends State<EvaluateStudentsScreen> {
  final List<Map<String, dynamic>> students = [
    {'id': 'S101', 'name': 'Ali'},
    {'id': 'S102', 'name': 'Sara'},
    {'id': 'S103', 'name': 'Hassan'},
  ];

  final Map<String, Map<String, double>> marks = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Evaluate - ${widget.courseName}'),
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];
          marks.putIfAbsent(student['id']!, () => {});

          return Card(
            margin: const EdgeInsets.all(10),
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${student['name']} (${student['id']})',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  ...widget.criteria.map((c) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText:
                          '${c['name']} (${c['marks']} marks)',
                          border: const OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          double mark = double.tryParse(value) ?? 0;
                          if (mark > c['marks']) mark = c['marks'].toDouble();
                          setState(() {
                            marks[student['id']]![c['name']] = mark;
                          });
                        },
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          );
        },
      ),
      //After submit redirect to teacher home page
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Marks Submitted Successfully!')),
          );
          MaterialPageRoute route = MaterialPageRoute(
            builder: (context) => const TeacherCoursesScreen(),
          );
          Navigator.pushReplacement(context, route);
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.check, color: Colors.white),
      ),
    );
  }
}

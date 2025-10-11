import 'package:flutter/material.dart';
import './Classes/courses_class.dart';

class ManageCoursesScreen extends StatefulWidget {
  const ManageCoursesScreen({super.key});

  @override
  State<ManageCoursesScreen> createState() => _ManageCoursesScreenState();
}

class _ManageCoursesScreenState extends State<ManageCoursesScreen> {
  final List<Course> _courses = [
    Course(
        id: 'CS3643',
        name: 'Operating System',
        teacher: 'Mr. Shahzad Ahmed Khan'),
    Course(
        id: 'CS4243',
        name: 'Mobile Application Development',
        teacher: 'Mr. Usman Karim'),
    Course(id: 'SE1130', name: 'Statistics', teacher: 'Dr. M. Aslam'),
    Course(
        id: 'CS3841',
        name: 'Web Programming',
        teacher: 'Ms. Ayesha Siddiqa'),
    Course(
        id: 'SE2020',
        name: 'Software Construction',
        teacher: 'Dr. Ali Raza'),
    Course(
        id: 'AI4010',
        name: 'Introduction to AI',
        teacher: 'Mr. Zeeshan Ali'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Courses'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: _courses.length,
          itemBuilder: (BuildContext context, int index) {
            final course = _courses[index];
            return Card(
              margin:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: ListTile(
                title: Text(course.name),
                subtitle: Text('Teacher: ${course.teacher} | ID: ${course.id}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.edit_outlined),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete_outline,
                          color: Colors.redAccent),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add Course',
        child: const Icon(Icons.add),
      ),
    );
  }
}
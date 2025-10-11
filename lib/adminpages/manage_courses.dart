import 'package:flutter/material.dart';
import 'Classes/add_courses_screen.dart';

class ManageCoursesScreen extends StatefulWidget {
  const ManageCoursesScreen({super.key});

  @override
  State<ManageCoursesScreen> createState() => _ManageCoursesScreenState();
}

class _ManageCoursesScreenState extends State<ManageCoursesScreen> {
  void _showEditCourseDialog({
    required String currentName,
    required String currentTeacher,
  }) {
    final TextEditingController nameController =
    TextEditingController(text: currentName);
    final TextEditingController teacherController =
    TextEditingController(text: currentTeacher);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Course'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Course Name'),
                autofocus: true,
              ),
              TextField(
                controller: teacherController,
                decoration: const InputDecoration(labelText: 'Teacher Name'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final snackBar = SnackBar(
                  content: const Text('Course Updated Successfully!'),
                  backgroundColor: Colors.green,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                Navigator.of(context).pop();
              },
              child: const Text('Update'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Courses'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: <Widget>[
            Card(
              child: ListTile(
                title: const Text('Operating System'),
                subtitle:
                const Text('Teacher: Mr. Shahzad Ahmed Khan | ID: CS3643'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.edit_outlined),
                      onPressed: () {
                        _showEditCourseDialog(
                          currentName: 'Operating System',
                          currentTeacher: 'Mr. Shahzad Ahmed Khan',
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete_outline,
                          color: Colors.redAccent),
                      onPressed: () {
                        final snackBar = SnackBar(
                          content: const Text('Deleted Successfully!'),
                          backgroundColor: Colors.red,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: const Text('Mobile Application Development'),
                subtitle: const Text('Teacher: Mr. Usman Karim | ID: CS4243'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.edit_outlined),
                      onPressed: () {
                        _showEditCourseDialog(
                          currentName: 'Mobile Application Development',
                          currentTeacher: 'Mr. Usman Karim',
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete_outline,
                          color: Colors.redAccent),
                      onPressed: () {
                        final snackBar = SnackBar(
                          content: const Text('Deleted Successfully!'),
                          backgroundColor: Colors.red,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddCourseScreen()),
          );
        },
        tooltip: 'Add Course',
        child: const Icon(Icons.add),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class EditCourseScreen extends StatefulWidget {
  final String currentName;
  final String currentTeacher;

  const EditCourseScreen({
    super.key,
    required this.currentName,
    required this.currentTeacher,
  });

  @override
  State<EditCourseScreen> createState() => _EditCourseScreenState();
}

class _EditCourseScreenState extends State<EditCourseScreen> {
  late TextEditingController nameController;
  late TextEditingController teacherController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.currentName);
    teacherController = TextEditingController(text: widget.currentTeacher);
  }

  @override
  void dispose() {
    nameController.dispose();
    teacherController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Course'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Course Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: teacherController,
              decoration: const InputDecoration(
                labelText: 'Teacher Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
              onPressed: () {
                final snackBar = SnackBar(
                  content: const Text('Course Updated Successfully!'),
                  backgroundColor: Colors.green,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                Navigator.of(context).pop();
              },
              child: const Text('Update Course'),
            ),
          ],
        ),
      ),
    );
  }
}
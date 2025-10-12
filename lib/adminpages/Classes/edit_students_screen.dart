import 'package:flutter/material.dart';

class EditStudentScreen extends StatefulWidget {
  final String currentName;
  final String currentSapId;
  final String currentDepartment;

  const EditStudentScreen({
    super.key,
    required this.currentName,
    required this.currentSapId,
    required this.currentDepartment,
  });

  @override
  State<EditStudentScreen> createState() => _EditStudentScreenState();
}

class _EditStudentScreenState extends State<EditStudentScreen> {
  late TextEditingController nameController;
  late TextEditingController sapIdController;
  late TextEditingController departmentController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.currentName);
    sapIdController = TextEditingController(text: widget.currentSapId);
    departmentController = TextEditingController(text: widget.currentDepartment);
  }

  @override
  void dispose() {
    nameController.dispose();
    sapIdController.dispose();
    departmentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Student'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Student Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: sapIdController,
              decoration: const InputDecoration(
                labelText: 'SAP ID',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: departmentController,
              decoration: const InputDecoration(
                labelText: 'Department',
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
                  content: const Text('Student Details Updated Successfully!'),
                  backgroundColor: Colors.green,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                Navigator.of(context).pop();
              },
              child: const Text('Update Details'),
            ),
          ],
        ),
      ),
    );
  }
}
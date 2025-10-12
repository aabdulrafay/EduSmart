import 'package:flutter/material.dart';
import './Classes/add_teacher_screen.dart';

class ManageTeachersScreen extends StatefulWidget {
  const ManageTeachersScreen({super.key});

  @override
  State<ManageTeachersScreen> createState() => _ManageTeachersScreenState();
}

class _ManageTeachersScreenState extends State<ManageTeachersScreen> {
  void _showEditTeacherDialog({
    required String name,
    required String department,
    required String designation,
  }) {
    final TextEditingController nameController = TextEditingController(text: name);
    final TextEditingController departmentController =
    TextEditingController(text: department);
    final TextEditingController designationController =
    TextEditingController(text: designation);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Teacher'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Teacher Name'),
                autofocus: true,
              ),
              TextField(
                controller: departmentController,
                decoration: const InputDecoration(labelText: 'Department'),
              ),
              TextField(
                controller: designationController,
                decoration: const InputDecoration(labelText: 'Designation'),
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
                  content: const Text('Teacher Updated Successfully!'),
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
        title: const Text('Manage Teachers'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: <Widget>[
          Card(
            child: ListTile(
              title: const Text('Dr. M. Aslam'),
              subtitle: const Text('Professor | Mathematics'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit_outlined),
                    onPressed: () {
                      _showEditTeacherDialog(
                        name: 'Dr. M. Aslam',
                        department: 'Mathematics',
                        designation: 'Professor',
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete_outline,
                        color: Colors.redAccent),
                    onPressed: () {
                      final snackBar = SnackBar(
                        content: const Text('Teacher Deleted Successfully!'),
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
              title: const Text('Mr. Shahzad Ahmed Khan'),
              subtitle: const Text('Associate Professor | Computer Science'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit_outlined),
                    onPressed: () {
                      _showEditTeacherDialog(
                        name: 'Mr. Shahzad Ahmed Khan',
                        department: 'Computer Science',
                        designation: 'Associate Professor',
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete_outline,
                        color: Colors.redAccent),
                    onPressed: () {
                      final snackBar = SnackBar(
                        content: const Text('Teacher Deleted Successfully!'),
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
              title: const Text('Mr. Usman Karim'),
              subtitle: const Text('Lecturer | Software Engineering'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit_outlined),
                    onPressed: () {
                      _showEditTeacherDialog(
                        name: 'Mr. Usman Karim',
                        department: 'Software Engineering',
                        designation: 'Lecturer',
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete_outline,
                        color: Colors.redAccent),
                    onPressed: () {
                      final snackBar = SnackBar(
                        content: const Text('Teacher Deleted Successfully!'),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTeacherScreen()),
          );
        },
        tooltip: 'Add Teacher',
        child: const Icon(Icons.add),
      ),
    );
  }
}
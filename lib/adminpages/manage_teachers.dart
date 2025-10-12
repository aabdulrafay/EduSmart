import 'package:flutter/material.dart';
import './Classes/add_teacher_screen.dart';
import './Classes/edit_teacher_screen.dart';

class ManageTeachersScreen extends StatefulWidget {
  const ManageTeachersScreen({super.key});

  @override
  State<ManageTeachersScreen> createState() => _ManageTeachersScreenState();
}

class _ManageTeachersScreenState extends State<ManageTeachersScreen> {
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EditTeacherScreen(
                            name: 'Dr. M. Aslam',
                            department: 'Mathematics',
                            designation: 'Professor',
                          ),
                        ),
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
              subtitle:
              const Text('Associate Professor | Computer Science'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit_outlined),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EditTeacherScreen(
                            name: 'Mr. Shahzad Ahmed Khan',
                            department: 'Computer Science',
                            designation: 'Associate Professor',
                          ),
                        ),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EditTeacherScreen(
                            name: 'Mr. Usman Karim',
                            department: 'Software Engineering',
                            designation: 'Lecturer',
                          ),
                        ),
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
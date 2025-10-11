import 'package:flutter/material.dart';
import 'Classes/add_teacher_screen.dart';

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
        children: const <Widget>[
          Card(
            child: ListTile(
              title: Text('Dr. M. Aslam'),
              subtitle: Text('Professor | Mathematics'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Mr. Shahzad Ahmed Khan'),
              subtitle: Text('Associate Professor | Computer Science'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Mr. Usman Karim'),
              subtitle: Text('Lecturer | Software Engineering'),
              trailing: Icon(Icons.arrow_forward_ios),
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
import 'package:flutter/material.dart';

class ManageStudentsScreen extends StatefulWidget {
  const ManageStudentsScreen({super.key});

  @override
  State<ManageStudentsScreen> createState() => _ManageStudentsScreenState();
}

class _ManageStudentsScreenState extends State<ManageStudentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Students'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: const <Widget>[
          Card(
            child: ListTile(
              title: Text('Ali Ahmed'),
              subtitle: Text('SAP ID: 70012345 | Software Engineering'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Fatima Khan'),
              subtitle: Text('SAP ID: 70023456 | Computer Science'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Bilal Hassan'),
              subtitle: Text('SAP ID: 70034567 | Electrical Engineering'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add Student',
        child: const Icon(Icons.add),
      ),
    );
  }
}
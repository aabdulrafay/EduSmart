import 'package:flutter/material.dart';
import './Classes/add_teacher_screen.dart';
import './Classes/edit_teacher_screen.dart';

class ManageTeachersScreen extends StatefulWidget {
  const ManageTeachersScreen({super.key});

  @override
  State<ManageTeachersScreen> createState() => _ManageTeachersScreenState();
}

class _ManageTeachersScreenState extends State<ManageTeachersScreen> {
  final List<Map<String, String>> teachers = [
    {
      'name': 'Dr. M. Aslam',
      'designation': 'Professor',
      'department': 'Mathematics',
    },
    {
      'name': 'Mr. Shahzad Ahmed Khan',
      'designation': 'Associate Professor',
      'department': 'Computer Science',
    },
    {
      'name': 'Mr. Usman Karim',
      'designation': 'Lecturer',
      'department': 'Software Engineering',
    },
  ];

  @override
  Widget build(BuildContext context) {
    const primaryBlue = Color(0xFF0A73B7);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Teachers'),
        backgroundColor: Colors.white,
        foregroundColor: primaryBlue,
        elevation: 1,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      // Body
      body: SafeArea(
        child: teachers.isEmpty
            ? const Center(
          child: Text(
            'No teachers available.',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        )
            : ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: teachers.length,
          itemBuilder: (context, index) {
            final teacher = teachers[index];
            return _buildTeacherCard(context, teacher);
          },
        ),
      ),

      // Floating Action Button
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryBlue,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTeacherScreen()),
          );
        },
        tooltip: 'Add Teacher',
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  // Card Design for Each Teacher
  Widget _buildTeacherCard(BuildContext context, Map<String, String> teacher) {
    const primaryBlue = Color(0xFF0A73B7);

    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue.shade100,
          child: Text(
            teacher['name']![0],
            style: const TextStyle(color: primaryBlue, fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(
          teacher['name']!,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text(
          '${teacher['designation']} | ${teacher['department']}',
          style: const TextStyle(color: Colors.black54),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit_outlined, color: primaryBlue),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditTeacherScreen(
                      name: teacher['name']!,
                      department: teacher['department']!,
                      designation: teacher['designation']!,
                    ),
                  ),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
              onPressed: () => _confirmDeleteTeacher(context, teacher),
            ),
          ],
        ),
      ),
    );
  }

  // Confirm Delete Dialog
  void _confirmDeleteTeacher(BuildContext context, Map<String, String> teacher) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Delete Teacher'),
        content: Text('Are you sure you want to delete ${teacher['name']}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                teachers.remove(teacher);
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${teacher['name']} deleted successfully!'),
                  backgroundColor: Colors.red,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              foregroundColor: Colors.white,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
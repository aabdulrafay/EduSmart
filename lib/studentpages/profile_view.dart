import 'package:flutter/material.dart';
import '../login_screen.dart';

class StudentProfileView extends StatefulWidget {
  const StudentProfileView({super.key});

  @override
  State<StudentProfileView> createState() => _StudentProfileViewState();
}

class _StudentProfileViewState extends State<StudentProfileView> {
  // Static demo data for 3 students
  final List<Map<String, String>> students = [
    {
      'name': 'Abdul Rafay',
      'studentId': '53325',
      'email': 'rafay@student.edu',
      'phone': '+92 300 1234567',
      'department': 'Software Engineering',
      'image': 'images/student.png',
    },
    {
      'name': 'Hassaan Zahid',
      'studentId': '57876',
      'email': 'hassaan@student.edu',
      'phone': '+92 301 7654321',
      'department': 'Software Engineering',
      'image': 'images/student2.png',
    },
    {
      'name': 'Abdul Rafay',
      'studentId': '54689',
      'email': 'abdul@student.edu',
      'phone': '+92 302 9876543',
      'department': 'Software Engineering',
      'image': 'images/student3.png',
    },
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final student = students[_selectedIndex];

    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Dropdown to switch between students
          DropdownButton<int>(
            value: _selectedIndex,
            items: List.generate(
              students.length,
                  (index) => DropdownMenuItem(
                value: index,
                child: Text(students[index]['name']!),
              ),
            ),
            onChanged: (value) {
              if (value != null) {
                setState(() => _selectedIndex = value);
              }
            },
          ),
          const SizedBox(height: 20),
          CircleAvatar(
            radius: 48,
            backgroundImage: AssetImage(student['image']!),
          ),
          const SizedBox(height: 14),
          Text(student['name']!,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text(
            '${student['department']} • ID: ${student['studentId']}',
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 12),
          ListTile(
            leading: const Icon(Icons.email_outlined),
            title: Text(student['email']!),
          ),
          ListTile(
            leading: const Icon(Icons.phone_outlined),
            title: Text(student['phone']!),
          ),
          const Spacer(),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
            icon: const Icon(Icons.logout),
            label: const Text('Logout'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../login_screen.dart';

class StudentProfileView extends StatefulWidget {
  const StudentProfileView({super.key});

  @override
  State<StudentProfileView> createState() => _StudentProfileViewState();
}

class _StudentProfileViewState extends State<StudentProfileView> {
  final List<Map<String, String>> students = [
    {
      'name': 'Abdul Rafay',
      'studentId': '53325',
      'email': '53325@students.riphah.edu.pk',
      'phone': '+92 348 5135553',
      'department': 'Software Engineering',
      'image': 'images/student.png',
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

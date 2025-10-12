import 'package:flutter/material.dart';
import '../login_screen.dart';

class StudentProfileView extends StatelessWidget {
  final String name;
  final String studentId;
  final String email;
  final String phone;
  final String department;
  final String gender;
  final String dateOfBirth;
  final String address;
  final String profileImageUrl;

  const StudentProfileView({
    super.key,
    required this.name,
    required this.studentId,
    required this.email,
    required this.phone,
    required this.department,
    required this.gender,
    required this.dateOfBirth,
    required this.address,
    required this.profileImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(profileImageUrl),
              ),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: Text(
                name,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8.0),
            Center(
              child: Text(
                'ID: $studentId',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
            ),
            const SizedBox(height: 8.0),
            Center(
              child: Text(
                department,
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
            ),
            const SizedBox(height: 16.0),
            const Divider(),

            // Contact Information Section
            const SizedBox(height: 16.0),
            const Text(
              'Contact Information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            ListTile(
              leading: const Icon(Icons.email),
              title: Text(email),
            ),
            ListTile(
              leading: const Icon(Icons.phone),
              title: Text(phone),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: Text(address),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: Text(gender),
            ),
            ListTile(
              leading: const Icon(Icons.cake),
              title: Text(dateOfBirth),
            ),

            const SizedBox(height: 24.0),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                        (route) => false,
                  );
                },
                icon: const Icon(Icons.logout),
                label: const Text('Logout'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade400,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
                  textStyle: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:edusmart/pages/login_screen.dart';

class AdminProfileView extends StatelessWidget {
  final String name;
  final String role;
  final String email;
  final String employeeId;
  final String phone;
  final String profileImageUrl;

  const AdminProfileView({
    super.key,
    required this.name,
    required this.role,
    required this.email,
    required this.employeeId,
    required this.phone,
    required this.profileImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                style:
                const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8.0),
            Center(
              child: Text(
                role,
                style: TextStyle(fontSize: 18, color: Colors.grey[700]),
              ),
            ),
            const SizedBox(height: 24.0),
            const Divider(),
            const SizedBox(height: 16.0),
            const Text(
              'Admin Information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            ListTile(
              leading: const Icon(Icons.email_outlined),
              title: Text(email),
            ),
            ListTile(
              leading: const Icon(Icons.phone_outlined),
              title: Text(phone),
            ),
            ListTile(
              leading: const Icon(Icons.badge_outlined),
              title: Text(employeeId),
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 10.0),
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
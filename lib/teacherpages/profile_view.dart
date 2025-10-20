import 'package:flutter/material.dart';
import 'package:edusmart/pages/login_screen.dart';

class TeacherProfileView extends StatelessWidget {
  final String name;
  final String department;
  final String designation;
  final String bio;
  final String profileImageUrl;
  final String email;
  final String phone;
  final String cnic;
  final String address;
  final String gender;
  final String dateOfBirth;
  final String qualification;

  const TeacherProfileView({
    super.key,
    required this.name,
    required this.department,
    required this.designation,
    required this.bio,
    required this.profileImageUrl,
    required this.email,
    required this.phone,
    required this.cnic,
    required this.address,
    required this.gender,
    required this.dateOfBirth,
    required this.qualification,
  });

  @override
  Widget build(BuildContext context) {
    const primaryBlue = Color(0xFF0A73B7);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Teacher Profile'),
        backgroundColor: Colors.white,
        foregroundColor: primaryBlue,
        centerTitle: true,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(profileImageUrl),
            ),
            const SizedBox(height: 16),
            Text(
              name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              designation,
              style: const TextStyle(color: Colors.grey),
            ),
            Text(
              department,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'About Me',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: primaryBlue,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              bio,
              style: const TextStyle(fontSize: 15, height: 1.4),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 20),
            const Divider(),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Contact Information',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: primaryBlue,
                ),
              ),
            ),
            const SizedBox(height: 10),
            _infoTile(Icons.email_outlined, 'Email', email),
            _infoTile(Icons.phone_outlined, 'Phone', phone),
            _infoTile(Icons.credit_card, 'CNIC', cnic),
            _infoTile(Icons.home_outlined, 'Address', address),
            _infoTile(Icons.person_outline, 'Gender', gender),
            _infoTile(Icons.cake_outlined, 'Date of Birth', dateOfBirth),
            _infoTile(Icons.school_outlined, 'Qualification', qualification),
            const SizedBox(height: 30),
            ElevatedButton.icon(
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
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoTile(IconData icon, String label, String value) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: Icon(icon, color: Color(0xFF0A73B7)),
        title: Text(label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        subtitle: Text(value),
      ),
    );
  }
}
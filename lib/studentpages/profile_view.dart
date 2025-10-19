import 'package:flutter/material.dart';
import 'package:edusmart/pages/login_screen.dart';

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
    const primaryBlue = Color(0xFF0A73B7);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        backgroundColor: Colors.white,
        foregroundColor: primaryBlue,
        centerTitle: true,
        elevation: 1,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Photo
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(profileImageUrl),
              ),
              const SizedBox(height: 16.0),

              // Name and ID
              Text(
                name,
                style:
                const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Text(
                'ID: $studentId',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              const SizedBox(height: 8.0),
              Text(
                department,
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              const SizedBox(height: 16.0),
              const Divider(),

              // Contact Information
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Contact Information',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: primaryBlue,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),

              _buildInfoTile(Icons.email, 'Email', email),
              _buildInfoTile(Icons.phone, 'Phone', phone),
              _buildInfoTile(Icons.home, 'Address', address),
              _buildInfoTile(Icons.person, 'Gender', gender),
              _buildInfoTile(Icons.cake, 'Date of Birth', dateOfBirth),

              const SizedBox(height: 30.0),

              // Logout Button
              ElevatedButton.icon(
                onPressed: () {
                  // Logout and go back to login screen
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                        (route) => false,
                  );
                },
                icon: const Icon(Icons.logout),
                label: const Text('Logout'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade400,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32.0,
                    vertical: 12.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //  Reusable info row for contact details
  Widget _buildInfoTile(IconData icon, String label, String value) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        subtitle: Text(value),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:edusmart/pages/login_screen.dart';

class AdminProfileView extends StatelessWidget {
  final String name;
  final String role;
  final String email;
  final String employeeId;
  final String phone;
  final String profileImageUrl;
  final bool isVerified;

  const AdminProfileView({
    super.key,
    required this.name,
    required this.role,
    required this.email,
    required this.employeeId,
    required this.phone,
    required this.profileImageUrl,
    this.isVerified = true,
  });

  @override
  Widget build(BuildContext context) {
    const primaryBlue = Color(0xFF0A73B7);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Profile'),
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
              // Profile Picture
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(profileImageUrl),
              ),
              const SizedBox(height: 16.0),

              // Name + Verified Badge
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (isVerified)
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Icon(
                        Icons.verified,
                        color: Colors.blue,
                        size: 22,
                      ),
                    ),
                ],
              ),

              const SizedBox(height: 8.0),
              Text(
                role,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 24.0),
              const Divider(),

              // Info Section Title
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Admin Information',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: primaryBlue,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),

              _buildInfoCard(Icons.email_outlined, 'Email', email),
              _buildInfoCard(Icons.phone_outlined, 'Phone', phone),
              _buildInfoCard(Icons.badge_outlined, 'Employee ID', employeeId),

              const SizedBox(height: 30.0),

              // Logout Button
              ElevatedButton.icon(
                onPressed: () {
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

  // Reusable Card for Info
  Widget _buildInfoCard(IconData icon, String title, String value) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(
          title,
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
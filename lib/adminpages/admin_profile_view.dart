import 'package:flutter/material.dart';
import 'package:edusmart/login_screen.dart';

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
    final textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Profile Header Card
          Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey.shade200, // Placeholder background
                    backgroundImage: NetworkImage(profileImageUrl),
                    onBackgroundImageError: (exception, stackTrace) {
                      // Optional: handle image loading errors, e.g., show a default icon
                      debugPrint('Error loading profile image: $exception');
                    },
                    child: (profileImageUrl == '')
                        ? Icon(
                      Icons.person, // Default icon if no image
                      size: 50,
                      color: Colors.grey.shade600,
                    )
                        : null,
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    name,
                    style: textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    role,
                    style: textTheme.titleMedium?.copyWith(color: Colors.grey.shade600),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24.0),

          // Admin Information Card
          Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
                  child: Text(
                    'Admin Information',
                    style: textTheme.titleLarge,
                  ),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.email_outlined),
                  title: const Text('Email'),
                  subtitle: Text(email),
                ),
                ListTile(
                  leading: const Icon(Icons.phone_outlined),
                  title: const Text('Phone'),
                  subtitle: Text(phone),
                ),
                ListTile(
                  leading: const Icon(Icons.fingerprint), // Changed icon
                  title: const Text('Employee ID'),
                  subtitle: Text(employeeId),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24.0),

          // Logout Button
          Center( // Keep it centered
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                      (route) => false,
                );
              },
              icon: const Icon(Icons.power_settings_new, size: 20), // Smaller icon
              label: const Text('Logout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade400,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 10.0), // Smaller padding
                textStyle: const TextStyle(fontSize: 16), // Smaller text
              ),
            ),
          ),
        ],
      ),
    );
  }
}
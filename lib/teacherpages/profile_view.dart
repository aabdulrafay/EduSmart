//teacher profile view simple outstanding with log out button
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


  TeacherProfileView({
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Teacher Profile'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(profileImageUrl),
              ),
            ),
            SizedBox(height: 16.0),
            Center(
              child: Text(
                name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8.0),
            Center(
              child: Text(
                designation,
                style: TextStyle(fontSize: 18, color: Colors.grey[700]),
              ),
            ),
            SizedBox(height: 8.0),
            Center(
              child: Text(
                department,
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Bio',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              bio,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),
            Divider(),
            SizedBox(height: 16.0),
            Text(
              'Contact Information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            ListTile(
              leading: Icon(Icons.email),
              title: Text(email),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text(phone),
            ),
            ListTile(
              leading: Icon(Icons.credit_card),
              title: Text(cnic),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text(address),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text(gender),
            ),
            ListTile(
              leading: Icon(Icons.cake),
              title: Text(dateOfBirth),
            ),
            ListTile(
              leading: Icon(Icons.school),
              title: Text(qualification),
            ),
            SizedBox(height: 24.0),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Navigate to login page and clear the navigation stack
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                    (route) => false,
                  );
                },
                icon: Icon(Icons.logout),
                label: Text('Logout'),
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
      ),
    );
  }
}
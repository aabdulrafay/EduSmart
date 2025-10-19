import 'package:flutter/material.dart';
import 'manage_courses.dart';
import 'manage_teachers.dart';
import 'manage_students.dart';
import 'manage_admins.dart';

class DashboardView extends StatelessWidget {
  final bool isVerified; // Indicates if the admin is verified

  const DashboardView({super.key, this.isVerified = true});

  @override
  Widget build(BuildContext context) {
    const primaryBlue = Color(0xFF0A73B7);

    // List of dashboard feature cards
    final List<Widget> featureCards = [
      _buildFeatureCard(
        context: context,
        icon: Icons.book_outlined,
        title: 'Manage Courses',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ManageCoursesScreen(),
            ),
          );
        },
      ),
      _buildFeatureCard(
        context: context,
        icon: Icons.people_outline,
        title: 'Manage Teachers',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ManageTeachersScreen(),
            ),
          );
        },
      ),
      _buildFeatureCard(
        context: context,
        icon: Icons.person_search_outlined,
        title: 'Manage Students',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ManageStudentsScreen(),
            ),
          );
        },
      ),
    ];

    // Add “Manage Admins” card only if admin is verified
    if (isVerified) {
      featureCards.add(
        _buildFeatureCard(
          context: context,
          icon: Icons.verified_user_outlined,
          title: 'Manage Admins',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ManageAdminsScreen(),
              ),
            );
          },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        backgroundColor: Colors.white,
        foregroundColor: primaryBlue,
        elevation: 1,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            children: featureCards,
          ),
        ),
      ),
    );
  }

  // Reusable card widget
  static Widget _buildFeatureCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: 140,
      height: 140,
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12.0),
          splashColor: Colors.blue.withOpacity(0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 50.0, color: Colors.blue),
              const SizedBox(height: 12.0),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
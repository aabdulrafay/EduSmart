import 'package:flutter/material.dart';
import 'manage_courses.dart'; // This import will now work

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        children: <Widget>[
          _buildFeatureCard(
            icon: Icons.book_outlined,
            title: 'Manage Courses',
            context: context,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ManageCourses()),
              );
            },
          ),
          _buildFeatureCard(
            icon: Icons.people_outline,
            title: 'Manage Teachers',
            context: context,
            onTap: () { /* Add navigation later */ },
          ),
          _buildFeatureCard(
            icon: Icons.person_search_outlined,
            title: 'Manage Students',
            context: context,
            onTap: () { /* Add navigation later */ },
          ),
        ],
      ),
    );
  }

  // This helper method is now correctly placed within the class
  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required BuildContext context,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 50.0, color: Theme.of(context).primaryColor),
            const SizedBox(height: 16.0),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
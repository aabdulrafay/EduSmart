import 'package:flutter/material.dart';
import 'package:edusmart/teacherpages/Attendance/mark_attendance_screen.dart';
import 'package:edusmart/teacherpages/Attendance/export_attendance_screen.dart';
import 'package:edusmart/teacherpages/Result Screens/teacher_courses_screen.dart';
import 'package:edusmart/teacherpages/Result Screens/export_result_report_screen.dart';

class TeacherDashboard extends StatelessWidget {
  const TeacherDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryBlue = Color(0xFF0A73B7);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Colors.white,
        foregroundColor: primaryBlue,
        elevation: 1,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.count(
            crossAxisCount: 2, // two cards in a row
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            children: <Widget>[
              _buildFeatureCard(
                icon: Icons.check_circle_outline,
                title: 'Mark Attendance',
                context: context,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MarkAttendanceScreen(),
                    ),
                  );
                },
              ),
              _buildFeatureCard(
                icon: Icons.file_download_outlined,
                title: 'Export Attendance Report',
                context: context,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ExportAttendanceScreen(),
                    ),
                  );
                },
              ),
              _buildFeatureCard(
                icon: Icons.assignment_outlined,
                title: 'Evaluate Students',
                context: context,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TeacherCoursesScreen(),
                    ),
                  );
                },
              ),
              _buildFeatureCard(
                icon: Icons.file_download_outlined,
                title: 'Export Result Report',
                context: context,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ExportResultReportScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable card widget for each dashboard feature
  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required BuildContext context,
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
            children: <Widget>[
              Icon(icon, size: 50.0, color: Colors.blue),
              const SizedBox(height: 12.0),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15.0,
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

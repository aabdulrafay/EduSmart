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
        title: const Text('Teacher Dashboard'),
        backgroundColor: Colors.white,
        foregroundColor: primaryBlue,
        centerTitle: true,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildFeatureCard(
              icon: Icons.check_circle_outline,
              title: 'Mark Attendance',
              color: primaryBlue,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const MarkAttendanceScreen(),
                  ),
                );
              },
            ),
            _buildFeatureCard(
              icon: Icons.picture_as_pdf_outlined,
              title: 'Export Attendance',
              color: primaryBlue,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ExportAttendanceScreen(),
                  ),
                );
              },
            ),
            _buildFeatureCard(
              icon: Icons.assignment_outlined,
              title: 'Evaluate Students',
              color: primaryBlue,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const TeacherCoursesScreen(),
                  ),
                );
              },
            ),
            _buildFeatureCard(
              icon: Icons.file_download_outlined,
              title: 'Export Results',
              color: primaryBlue,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ExportResultReportScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: color, size: 45),
              const SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
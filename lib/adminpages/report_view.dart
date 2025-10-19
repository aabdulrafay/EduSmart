import 'package:flutter/material.dart';

class ReportsView extends StatelessWidget {
  const ReportsView({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryBlue = Color(0xFF0A73B7);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reports'),
        backgroundColor: Colors.white,
        foregroundColor: primaryBlue,
        centerTitle: true,
        elevation: 1,
      ),
      body: SafeArea(
        child: _buildReportList(context),
      ),
    );
  }
  // Report list builder
  Widget _buildReportList(BuildContext context) {
    const primaryBlue = Color(0xFF0A73B7);
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        _buildReportCard(
          context,
          icon: Icons.people_alt_outlined,
          title: 'Enrolled Students Report',
          subtitle: 'Generate a list of all students in a course.',
          onPressedMessage: 'Enrolled students report generated!',
          buttonColor: primaryBlue,
        ),
        const SizedBox(height: 16.0),
        _buildReportCard(
          context,
          icon: Icons.checklist_rtl_outlined,
          title: 'Attendance Sheets',
          subtitle: 'Generate attendance records for a course.',
          onPressedMessage: 'Attendance sheet generated!',
          buttonColor: primaryBlue,
        ),
        const SizedBox(height: 16.0),
        _buildReportCard(
          context,
          icon: Icons.co_present_outlined,
          title: 'Teachers Report',
          subtitle: 'Generate a list of all teachers and their details.',
          onPressedMessage: 'Teachers report generated!',
          buttonColor: primaryBlue,
        ),
      ],
    );
  }

  // Reusable card builder
  Widget _buildReportCard(
      BuildContext context, {
        required IconData icon,
        required String title,
        required String subtitle,
        required String onPressedMessage,
        required Color buttonColor,
      }) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        leading: Icon(icon, size: 40, color: Colors.blueGrey),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: ElevatedButton.icon(
          onPressed: () {
            final snackBar = SnackBar(
              content: Text(onPressedMessage),
              backgroundColor: Colors.green,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          icon: const Icon(Icons.download_outlined, size: 18),
          label: const Text('Generate'),
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class ReportsView extends StatelessWidget {
  const ReportsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: ListTile(
            leading: const Icon(Icons.people_alt_outlined, size: 40),
            title: const Text(
              'Enrolled Students Report',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle:
            const Text('Generate a list of all students in a course.'),
            trailing: ElevatedButton.icon(
              onPressed: () {
                final snackBar = SnackBar(
                  content: const Text('Enrolled students report generated!'),
                  backgroundColor: Colors.green,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              icon: const Icon(Icons.download_outlined, size: 18),
              label: const Text('Generate'),
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: ListTile(
            leading: const Icon(Icons.checklist_rtl_outlined, size: 40),
            title: const Text(
              'Attendance Sheets',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle:
            const Text('Generate attendance records for a course.'),
            trailing: ElevatedButton.icon(
              onPressed: () {
                final snackBar = SnackBar(
                  content: const Text('Attendance sheet generated!'),
                  backgroundColor: Colors.green,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              icon: const Icon(Icons.download_outlined, size: 18),
              label: const Text('Generate'),
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: ListTile(
            leading: const Icon(Icons.co_present_outlined, size: 40),
            title: const Text(
              'Teachers Report',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle:
            const Text('Generate a list of all teachers and their details.'),
            trailing: ElevatedButton.icon(
              onPressed: () {
                final snackBar = SnackBar(
                  content: const Text('Teachers report generated!'),
                  backgroundColor: Colors.green,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              icon: const Icon(Icons.download_outlined, size: 18),
              label: const Text('Generate'),
            ),
          ),
        ),
      ],
    );
  }
}
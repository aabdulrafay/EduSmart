import 'package:flutter/material.dart';
import 'manage_courses.dart';
import 'manage_teachers.dart';
import 'manage_students.dart';

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
          Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ManageCoursesScreen()),
                );
              },
              borderRadius: BorderRadius.circular(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.book_outlined,
                      size: 50.0, color: Theme.of(context).iconTheme.color),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Manage Courses',
                    textAlign: TextAlign.center,
                    style:
                    TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ManageTeachersScreen()),
                );
              },
              borderRadius: BorderRadius.circular(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.people_outline,
                      size: 50.0, color: Theme.of(context).iconTheme.color),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Manage Teachers',
                    textAlign: TextAlign.center,
                    style:
                    TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ManageStudentsScreen()),
                );
              },
              borderRadius: BorderRadius.circular(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.person_search_outlined,
                      size: 50.0, color: Theme.of(context).iconTheme.color),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Manage Students',
                    textAlign: TextAlign.center,
                    style:
                    TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
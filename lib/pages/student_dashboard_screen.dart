import 'package:flutter/material.dart';
import 'package:edusmart/studentpages/dashboard_view.dart';
import 'package:edusmart/studentpages/enrollment_view.dart';
import 'package:edusmart/studentpages/grades_view.dart';
import 'package:edusmart/studentpages/profile_view.dart';

class StudentDashboardScreen extends StatefulWidget {
  const StudentDashboardScreen({super.key});

  @override
  State<StudentDashboardScreen> createState() => _StudentDashboardScreenState();
}

class _StudentDashboardScreenState extends State<StudentDashboardScreen> {
  int _selectedIndex = 0;

  // Pages for each tab in the bottom navigation bar
  static final List<Widget> _widgetOptions = <Widget>[
    const StudentDashboard(),
    const StudentEnrollmentView(),
    const StudentGradesView(
      resultsSubmitted: true,
      resultsBySession: {},
    ),
    const StudentProfileView(
      name: 'Student Name',
      studentId: 'SAP12345',
      email: 'student@edusmart.edu.pk',
      phone: '123-456-7890',
      department: 'Software Engineering',
      gender: 'Male',
      dateOfBirth: '2000-01-01',
      address: '123 Main St, Karachi, Pakistan',
      profileImageUrl: 'https://static.thenounproject.com/png/3632534-200.png',
    ),
  ];

  // Handle user tap on navigation bar item
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const primaryBlue = Color(0xFF0A73B7);

    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school_outlined),
            label: 'Enrollment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grade_outlined),
            label: 'Grades',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: primaryBlue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

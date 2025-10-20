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

  static final List<Widget> _widgetOptions = <Widget>[
    const StudentDashboard(),
    const StudentEnrollmentView(),
    const StudentGradesView(
      resultsSubmitted: true,
      resultsBySession: {},
    ),
    const StudentProfileView(
      name: 'Student Name',
      studentId: 'SAP ID',
      email: 'student@edusmart.edu.pk',
      phone: '123-456-7890',
      department: 'Software Engineering',
      gender: 'Male',
      dateOfBirth: '2000-01-01',
      address: 'I-14, Islamabad, Pakistan',
      profileImageUrl: 'https://static.thenounproject.com/png/3632534-200.png',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const primaryBlue = Color(0xFF0A73B7);

    return Scaffold(
      backgroundColor: Colors.white,
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: primaryBlue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
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
      ),
    );
  }
}
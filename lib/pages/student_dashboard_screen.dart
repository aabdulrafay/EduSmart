import 'package:flutter/material.dart';
import 'package:edusmart/studentpages/dashbaord_view.dart';
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

  static const List<Widget> _widgetOptions = <Widget>[
    StudentDashboard(),
    StudentEnrollmentView(),
    StudentGradesView(
      enrolledCourses: [],
      resultsSubmitted: true,
      resultsMap: {},
    ),
    StudentProfileView(
      name: 'Student Name',
      studentId: 'sapid',
      email: 'student@edusmart.edu.pk',
      phone: '123-456-7890',
      department: 'Software Engineering',
      gender: 'Male',
      dateOfBirth: '2000-01-01',
      address: '123 Main St, City, Country',
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
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Enrollment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grade),
            label: 'Grades',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
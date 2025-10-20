import 'package:flutter/material.dart';
import 'package:edusmart/teacherpages/dashboard_view.dart';
import 'package:edusmart/teacherpages/profile_view.dart';

class TeacherDashboardScreen extends StatefulWidget {
  const TeacherDashboardScreen({super.key});

  @override
  State<TeacherDashboardScreen> createState() => _TeacherDashboardScreenState();
}

class _TeacherDashboardScreenState extends State<TeacherDashboardScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const TeacherDashboard(),
    const TeacherProfileView(
      name: 'Teacher Name',
      department: 'Software Engineering',
      designation: 'Senior Lecturer',
      bio: 'Experienced educator with a passion for teaching.',
      profileImageUrl: 'https://static.thenounproject.com/png/3632534-200.png',
      email: 'teacherName@edusmart.pk',
      phone: '123-456-7890',
      cnic: '12345-6789012-3',
      address: 'I-14, Islamabad, Pakistan',
      gender: 'Male',
      dateOfBirth: '1995-01-01',
      qualification: 'MSc Computer Science',
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
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import './teacherpages/dashboard_view.dart';
import './teacherpages/profile_view.dart';

class TeacherDashboardScreen extends StatefulWidget {
  @override
  _TeacherDashboardScreenState createState() => _TeacherDashboardScreenState();
}
class _TeacherDashboardScreenState extends State<TeacherDashboardScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    TeacherDashboard(),
    TeacherProfileView(
      name: 'John Doe',
      department: 'Mathematics',
      designation: 'Professor',
      bio: 'Experienced educator with a passion for teaching.',
      profileImageUrl: 'https://static.thenounproject.com/png/3632534-200.png',
      email: '@riphah.edu.pk',
      phone: '123-456-7890',
      cnic: '12345-6789012-3',
      address: '123 Main St, City, Country',
      gender: 'Male',
      dateOfBirth: '01-01-1980',
      qualification: 'PhD in Mathematics',
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


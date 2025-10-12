import 'package:flutter/material.dart';
import './adminpages/dashboard_view.dart';
import './adminpages/report_view.dart';
import './adminpages/admin_profile_view.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const DashboardView(),
    const ReportsView(),
    const AdminProfileView(
      name: 'System Administrator',
      role: 'System Administrator',
      email: 'admin@edusmart.pk',
      employeeId: 'F54323',
      phone: '+92 300 1234567',
      profileImageUrl:
      'data:image/png;base64,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',
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
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        automaticallyImplyLeading: false,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_outlined),
            label: 'Reports',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
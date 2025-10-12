import 'package:flutter/material.dart';
import './studentpages/enrollment_view.dart';
import './studentpages/grades_view.dart';
import './studentpages/profile_view.dart';

class StudentDashboardScreen extends StatefulWidget {
  const StudentDashboardScreen({super.key});

  @override
  State<StudentDashboardScreen> createState() => _StudentDashboardScreenState();
}

class _StudentDashboardScreenState extends State<StudentDashboardScreen> {
  int _selectedIndex = 0;

  final List<String> _enrolledCourses = ['Database Systems', 'Mobile App Dev'];
  bool _resultsSubmitted = true;

  final Map<String, Map<String, dynamic>> _resultsMap = {
    'Mobile App Development': {'marks': 85, 'grade': 'A'},
    'Database Systems': {'marks': 78, 'grade': 'B+'},
    'Software Engineering': {'marks': 91, 'grade': 'A+'},
  };

  List<Widget> _buildPages() {
    return [
      _buildDashboard(),
      StudentEnrollmentView(initialCourse: null, onEnrollmentSuccess: (_) {}),
      StudentGradesView(
        enrolledCourses: _enrolledCourses,
        resultsSubmitted: _resultsSubmitted,
        resultsMap: _resultsMap,
      ),
      const StudentProfileView(),
    ];
  }

  Widget _buildDashboard() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: [
          _buildDashboardCard(
            icon: Icons.app_registration_outlined,
            title: 'Enroll Courses',
            onTap: () => setState(() => _selectedIndex = 1),
          ),
          _buildDashboardCard(
            icon: Icons.grade_outlined,
            title: 'View Grades',
            onTap: () => setState(() => _selectedIndex = 2),
          ),
          _buildDashboardCard(
            icon: Icons.person_outline,
            title: 'My Profile',
            onTap: () => setState(() => _selectedIndex = 3),
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardCard({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: Colors.blueGrey),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final pages = _buildPages();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Dashboard'),
        automaticallyImplyLeading: false,
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book_outlined), label: 'My Courses'),
          BottomNavigationBarItem(icon: Icon(Icons.grade_outlined), label: 'Grades'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

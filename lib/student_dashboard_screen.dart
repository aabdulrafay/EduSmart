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

  // Central state
  final List<String> _enrolledCourses = [];
  bool _resultsSubmitted = false;

  // Dummy grade data
  final Map<String, Map<String, dynamic>> _resultsMap = {
    'Mobile App Development': {'marks': 85, 'grade': 'A'},
    'Database Systems': {'marks': 78, 'grade': 'B+'},
    'Software Engineering': {'marks': 91, 'grade': 'A+'},
  };

  // Pages setup
  List<Widget> _buildPages() {
    return [
      _buildDashboardView(),
      StudentEnrollmentView(
        onEnrollmentSuccess: (String enrolledCourse) {
          if (!_enrolledCourses.contains(enrolledCourse)) {
            setState(() {
              _enrolledCourses.add(enrolledCourse);
            });
          }
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Enrolled in $enrolledCourse')),
          );
        },
      ),
      StudentGradesView(
        enrolledCourses: _enrolledCourses,
        resultsSubmitted: _resultsSubmitted,
        resultsMap: _resultsMap,
      ),
      const StudentProfileView(),
    ];
  }

  // Dashboard Page (like Admin)
  Widget _buildDashboardView() {
    final List<Map<String, dynamic>> dashboardCards = [
      {
        'title': 'My Courses',
        'icon': Icons.menu_book_outlined,
        'color': Colors.blue,
        'onTap': () => _onItemTapped(1),
      },
      {
        'title': 'My Grades',
        'icon': Icons.grade_outlined,
        'color': Colors.teal,
        'onTap': () => _onItemTapped(2),
      },
      {
        'title': 'My Profile',
        'icon': Icons.person_outline,
        'color': Colors.deepPurple,
        'onTap': () => _onItemTapped(3),
      },
      {
        'title': 'Results Visibility (Dev)',
        'icon': _resultsSubmitted ? Icons.visibility : Icons.visibility_off,
        'color': Colors.orange,
        'onTap': () {
          setState(() {
            _resultsSubmitted = !_resultsSubmitted;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Results visibility: $_resultsSubmitted')),
          );
        },
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: dashboardCards.map((card) {
          return GestureDetector(
            onTap: card['onTap'],
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              color: card['color'].withOpacity(0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(card['icon'], color: card['color'], size: 40),
                  const SizedBox(height: 12),
                  Text(
                    card['title'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: card['color'].shade700,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined),
            label: 'My Courses',
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

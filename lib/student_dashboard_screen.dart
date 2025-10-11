// student_dashboard_screen.dart
import 'package:flutter/material.dart';
import './studentpages/courses_view.dart';
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
  String? _courseToEnroll; // holds course selected on Courses page

  // Central state: enrolled courses and results
  final List<String> _enrolledCourses = [];
  bool _resultsSubmitted = false; // simulate admin publishing results

  // sample results map (replace with real backend data later)
  final Map<String, Map<String, dynamic>> _resultsMap = {
    'Mobile App Development': {'marks': 85, 'grade': 'A'},
    'Database Systems': {'marks': 78, 'grade': 'B+'},
    'Software Engineering': {'marks': 91, 'grade': 'A+'},
  };

  // Build pages dynamically so we can pass callbacks/params
  List<Widget> _buildPages() {
    return [
      StudentCoursesView(
        onNavigateToEnroll: (String courseName) {
          setState(() {
            _courseToEnroll = courseName;
            _selectedIndex = 1; // switch to Enroll tab
          });
        },
      ),
      StudentEnrollmentView(
        initialCourse: _courseToEnroll,
        onEnrollmentSuccess: (String enrolledCourse) {
          setState(() {
            // keep enrolled courses unique
            if (!_enrolledCourses.contains(enrolledCourse)) {
              _enrolledCourses.add(enrolledCourse);
            }
            _selectedIndex = 2; // go to Grades tab
          });

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
        actions: [
          // DEV helper: toggle results submission quickly (remove for production)
          IconButton(
            tooltip: 'Toggle results (dev)',
            icon: Icon(_resultsSubmitted ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                _resultsSubmitted = !_resultsSubmitted;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('resultsSubmitted = $_resultsSubmitted')),
              );
            },
          ),
        ],
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined),
            label: 'Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.app_registration_outlined),
            label: 'Enroll',
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
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

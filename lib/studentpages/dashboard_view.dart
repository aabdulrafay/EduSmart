import 'package:flutter/material.dart';
import 'package:edusmart/studentpages/courses_view.dart';
import 'package:edusmart/studentpages/enrollment_view.dart';
import 'package:edusmart/studentpages/grades_view.dart';
import 'package:edusmart/studentpages/profile_view.dart';

class StudentDashboard extends StatefulWidget {
  const StudentDashboard({super.key});

  @override
  State<StudentDashboard> createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  // Example: if results are available, CGPA will have a value
  bool _resultPublished = false;
  double? _cgpa; // Can be null if not available

  @override
  void initState() {
    super.initState();
    // Example data: You can later set this based on real DB or API
    _resultPublished = true; // change to false to test "..."
    _cgpa = 3.75;
  }

  @override
  Widget build(BuildContext context) {
    const primaryBlue = Color(0xFF0A73B7);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Dashboard'),
        backgroundColor: Colors.white,
        foregroundColor: primaryBlue,
        elevation: 1,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            children: <Widget>[
              _buildFeatureCard(
                icon: Icons.library_books_outlined,
                title: 'Enroll Courses',
                context: context,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StudentEnrollmentView(),
                    ),
                  );
                },
              ),
              _buildFeatureCard(
                icon: Icons.menu_book_outlined,
                title: 'My Courses',
                context: context,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StudentCoursesView(),
                    ),
                  );
                },
              ),
              _buildResultCard(
                context: context,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StudentGradesView(
                        enrolledCourses: [],
                        resultsSubmitted: false,
                        resultsMap: {},
                      ),
                    ),
                  );
                },
              ),
              _buildFeatureCard(
                icon: Icons.person_outline,
                title: 'Profile',
                context: context,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StudentProfileView(
                        name: 'Student Name',
                        studentId: 'sapid',
                        email: 'student@edusmart.edu.pk',
                        phone: '123-456-7890',
                        department: 'Computer Science',
                        gender: 'Male',
                        dateOfBirth: '2000-01-01',
                        address: '123 Main St, City, Country',
                        profileImageUrl:
                        'https://static.thenounproject.com/png/3632534-200.png',
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable feature card widget
  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required BuildContext context,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: 140,
      height: 140,
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12.0),
          splashColor: Colors.blue.withOpacity(0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(icon, size: 48.0, color: Colors.blue),
              const SizedBox(height: 14.0),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Special card for showing result with CGPA or dots (...)
  Widget _buildResultCard({
    required BuildContext context,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: 140,
      height: 140,
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12.0),
          splashColor: Colors.blue.withOpacity(0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(Icons.grade_outlined, size: 48.0, color: Colors.blue),
              const SizedBox(height: 10.0),
              const Text(
                'Results',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                _resultPublished
                    ? 'CGPA: ${_cgpa?.toStringAsFixed(2)}'
                    : '⋯',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: _resultPublished ? Colors.green : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
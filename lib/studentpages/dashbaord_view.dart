import 'package:flutter/material.dart';
import 'package:edusmart/studentpages/courses_view.dart';
import 'package:edusmart/studentpages/enrollment_view.dart';
import 'package:edusmart/studentpages/grades_view.dart';
import 'package:edusmart/studentpages/profile_view.dart';


class StudentDashboard extends StatelessWidget {
  const StudentDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Dashboard'),
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
              _buildFeatureCard(
                icon: Icons.grade_outlined,
                title: 'Results',
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
                        profileImageUrl: 'https://static.thenounproject.com/png/3632534-200.png',
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

  // Reusable card widget
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
}

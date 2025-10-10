// In lib/adminpages/profile_view.dart

import 'package:flutter/material.dart';

// Make sure this class name is ProfileView
class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Profile View',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class AddTeacherScreen extends StatelessWidget {
  const AddTeacherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryBlue = Color(0xFF0A73B7);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Teacher'),
        backgroundColor: Colors.white,
        foregroundColor: primaryBlue,
        elevation: 1,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      // Form Body
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTextField(label: 'Teacher Name', icon: Icons.person_outline),
            const SizedBox(height: 16),
            _buildTextField(label: 'Department', icon: Icons.account_tree_outlined),
            const SizedBox(height: 16),
            _buildTextField(label: 'Designation', icon: Icons.work_outline),
            const SizedBox(height: 16),
            _buildTextField(
              label: 'Email',
              icon: Icons.email_outlined,
              inputType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 28),

            // Add Button
            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Teacher Added Successfully!'),
                    backgroundColor: Colors.green,
                  ),
                );
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.check_circle_outline),
              label: const Text(
                'Add Teacher',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryBlue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Reusable TextField Widget
  Widget _buildTextField({
    required String label,
    required IconData icon,
    TextInputType inputType = TextInputType.text,
  }) {
    const primaryBlue = Color(0xFF0A73B7);

    return TextField(
      keyboardType: inputType,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: primaryBlue),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: primaryBlue, width: 2),
        ),
      ),
    );
  }
}
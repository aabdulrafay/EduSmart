import 'package:flutter/material.dart';

class EditTeacherScreen extends StatefulWidget {
  final String name;
  final String department;
  final String designation;

  const EditTeacherScreen({
    super.key,
    required this.name,
    required this.department,
    required this.designation,
  });

  @override
  State<EditTeacherScreen> createState() => _EditTeacherScreenState();
}

class _EditTeacherScreenState extends State<EditTeacherScreen> {
  late TextEditingController nameController;
  late TextEditingController deptController;
  late TextEditingController desigController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.name);
    deptController = TextEditingController(text: widget.department);
    desigController = TextEditingController(text: widget.designation);
  }

  @override
  void dispose() {
    nameController.dispose();
    deptController.dispose();
    desigController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const primaryBlue = Color(0xFF0A73B7);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Teacher'),
        backgroundColor: Colors.white,
        foregroundColor: primaryBlue,
        elevation: 1,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      // Body
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTextField(
              controller: nameController,
              label: 'Teacher Name',
              icon: Icons.person_outline,
            ),
            const SizedBox(height: 16),
            _buildTextField(
              controller: deptController,
              label: 'Department',
              icon: Icons.account_tree_outlined,
            ),
            const SizedBox(height: 16),
            _buildTextField(
              controller: desigController,
              label: 'Designation',
              icon: Icons.work_outline,
            ),
            const SizedBox(height: 28),

            // Update Button
            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Teacher Updated Successfully!'),
                    backgroundColor: Colors.green,
                  ),
                );
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.save_outlined),
              label: const Text(
                'Update Teacher',
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

  // Reusable text field widget for cleaner UI
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    const primaryBlue = Color(0xFF0A73B7);

    return TextField(
      controller: controller,
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
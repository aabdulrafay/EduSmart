import 'package:flutter/material.dart';

class ManageAdminsScreen extends StatefulWidget {
  const ManageAdminsScreen({super.key});

  @override
  State<ManageAdminsScreen> createState() => _ManageAdminsScreenState();
}

class _ManageAdminsScreenState extends State<ManageAdminsScreen> {
  // Example list of admins (in real app, these could come from a database)
  final List<Map<String, dynamic>> _admins = [
    {
      'name': 'Ali Raza',
      'email': 'ali.raza@edusmart.pk',
      'role': 'Super Admin',
      'verified': true,
    },
    {
      'name': 'Sara Khan',
      'email': 'sara.khan@edusmart.pk',
      'role': 'Support Admin',
      'verified': false,
    },
    {
      'name': 'Usman Ahmed',
      'email': 'usman.ahmed@edusmart.pk',
      'role': 'Course Admin',
      'verified': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    const primaryBlue = Color(0xFF0A73B7);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Admins'),
        backgroundColor: Colors.white,
        foregroundColor: primaryBlue,
        centerTitle: true,
        elevation: 1,
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: _admins.length,
          itemBuilder: (context, index) {
            final admin = _admins[index];
            return _buildAdminCard(admin);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryBlue,
        onPressed: () {
          _showAddAdminDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  // Reusable Card for each Admin
  Widget _buildAdminCard(Map<String, dynamic> admin) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue.shade100,
          child: Text(
            admin['name'][0],
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          admin['name'],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('${admin['role']}\n${admin['email']}'),
        isThreeLine: true,
        trailing: admin['verified']
            ? const Icon(Icons.verified, color: Colors.blue)
            : const Icon(Icons.pending_outlined, color: Colors.grey),
        onTap: () {
          _showAdminDetails(context, admin);
        },
      ),
    );
  }

  /// 🔹 Dialog to Show Full Admin Details
  void _showAdminDetails(BuildContext context, Map<String, dynamic> admin) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(admin['name']),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Role: ${admin['role']}'),
            Text('Email: ${admin['email']}'),
            Text('Verified: ${admin['verified'] ? "Yes" : "No"}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  // Dialog to Add a New Admin (Demo UI only)
  void _showAddAdminDialog(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController roleController = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Add New Admin'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Full Name',
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: roleController,
              decoration: const InputDecoration(
                labelText: 'Role',
                prefixIcon: Icon(Icons.work_outline),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _admins.add({
                  'name': nameController.text,
                  'email': emailController.text,
                  'role': roleController.text,
                  'verified': false,
                });
              });
              Navigator.pop(context);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}

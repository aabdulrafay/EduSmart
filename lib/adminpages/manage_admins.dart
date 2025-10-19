import 'package:flutter/material.dart';

class ManageAdminsScreen extends StatefulWidget {
  const ManageAdminsScreen({super.key});

  @override
  State<ManageAdminsScreen> createState() => _ManageAdminsScreenState();
}

class _ManageAdminsScreenState extends State<ManageAdminsScreen> {
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
        onPressed: () => _showAddAdminDialog(context),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  // Reusable Admin Card
  Widget _buildAdminCard(Map<String, dynamic> admin) {
    const primaryBlue = Color(0xFF0A73B7);

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
              color: primaryBlue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          admin['name'],
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text(
          '${admin['role']}\n${admin['email']}',
          style: const TextStyle(color: Colors.black54, height: 1.3),
        ),
        isThreeLine: true,
        trailing: Icon(
          admin['verified'] ? Icons.verified : Icons.pending_outlined,
          color: admin['verified'] ? Colors.blue : Colors.grey,
        ),
        onTap: () => _showAdminDetails(context, admin),
      ),
    );
  }

  // View Admin Details Dialog
  void _showAdminDetails(BuildContext context, Map<String, dynamic> admin) {
    const primaryBlue = Color(0xFF0A73B7);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue.shade100,
              child: Text(
                admin['name'][0],
                style: const TextStyle(color: primaryBlue),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                admin['name'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _infoRow('Role', admin['role']),
            _infoRow('Email', admin['email']),
            _infoRow('Verified', admin['verified'] ? 'Yes' : 'No'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close', style: TextStyle(color: Colors.grey)),
          ),
        ],
      ),
    );
  }

  // Helper Widget for Info Display
  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$label:', style: const TextStyle(fontWeight: FontWeight.bold)),
          Flexible(child: Text(value)),
        ],
      ),
    );
  }

  // Add Admin Dialog
  void _showAddAdminDialog(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController roleController = TextEditingController();

    const primaryBlue = Color(0xFF0A73B7);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Add New Admin'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Full Name',
                prefixIcon: const Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: const Icon(Icons.email_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: roleController,
              decoration: InputDecoration(
                labelText: 'Role',
                prefixIcon: const Icon(Icons.work_outline),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.save),
            label: const Text('Add', style: TextStyle(fontWeight: FontWeight.bold)),
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryBlue,
              foregroundColor: Colors.white,
              padding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              if (nameController.text.isEmpty ||
                  emailController.text.isEmpty ||
                  roleController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please fill all fields before adding.'),
                    backgroundColor: Colors.redAccent,
                  ),
                );
                return;
              }

              setState(() {
                _admins.add({
                  'name': nameController.text,
                  'email': emailController.text,
                  'role': roleController.text,
                  'verified': false,
                });
              });

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content:
                  Text('Admin "${nameController.text}" added successfully!'),
                  backgroundColor: Colors.green,
                ),
              );
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
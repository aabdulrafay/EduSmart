import 'package:flutter/material.dart';

class ManageAdminsScreen extends StatefulWidget {
  const ManageAdminsScreen({super.key});

  @override
  State<ManageAdminsScreen> createState() => _ManageAdminsScreenState();
}

class _ManageAdminsScreenState extends State<ManageAdminsScreen> {
  List<Map<String, dynamic>> _admins = [
    {'name': 'Ali Raza', 'email': 'ali.raza@edusmart.pk', 'role': 'Super Admin', 'verified': true},
    {'name': 'Sara Khan', 'email': 'sara.khan@edusmart.pk', 'role': 'Support Admin', 'verified': false},
    {'name': 'Usman Ahmed', 'email': 'usman.ahmed@edusmart.pk', 'role': 'Course Admin', 'verified': true},
  ];

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF0A73B7);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Admins'),
        backgroundColor: Colors.white,
        foregroundColor: primaryColor,
        centerTitle: true,
        elevation: 1,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _admins.length,
        itemBuilder: (context, index) {
          var admin = _admins[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 3,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue.shade100,
                child: Text(
                  admin['name'][0],
                  style: const TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
                ),
              ),
              title: Text(admin['name'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              subtitle: Text('${admin['role']}\n${admin['email']}', style: const TextStyle(color: Colors.black54, height: 1.3)),
              isThreeLine: true,
              trailing: Icon(
                admin['verified'] ? Icons.verified : Icons.pending_outlined,
                color: admin['verified'] ? Colors.blue : Colors.grey,
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text(admin['name']),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Role:'), Text(admin['role'])]),
                        const SizedBox(height: 4),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Email:'), Text(admin['email'])]),
                        const SizedBox(height: 4),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Verified:'), Text(admin['verified'] ? 'Yes' : 'No')]),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(ctx),
                        child: const Text('Close', style: TextStyle(color: Colors.grey)),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {
          setState(() {
            _admins.add({'name': 'New Admin', 'email': 'new@edusmart.pk', 'role': 'Admin', 'verified': false});
          });
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

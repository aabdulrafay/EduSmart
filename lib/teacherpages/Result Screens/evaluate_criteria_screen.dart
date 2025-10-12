import 'package:flutter/material.dart';
import 'evaluate_students_screen.dart';

class SetMarksCriteriaScreen extends StatefulWidget {
  final String courseName;
  const SetMarksCriteriaScreen({super.key, required this.courseName});

  @override
  State<SetMarksCriteriaScreen> createState() => _SetMarksCriteriaScreenState();
}

class _SetMarksCriteriaScreenState extends State<SetMarksCriteriaScreen> {
  final List<Map<String, dynamic>> _criteria = [];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _marksController = TextEditingController();

  int get totalMarks =>
      _criteria.fold(0, (sum, item) => sum + (item['marks'] as int));

  void _addCriteria() {
    final String name = _nameController.text.trim();
    final int? marks = int.tryParse(_marksController.text);

    if (name.isNotEmpty && marks != null && marks > 0) {
      setState(() {
        _criteria.add({'name': name, 'marks': marks});
        _nameController.clear();
        _marksController.clear();
      });
    }
  }

  void _editCriteria(int index) {
    // Create new local controllers so main form is not affected
    final TextEditingController editNameController =
    TextEditingController(text: _criteria[index]['name']);
    final TextEditingController editMarksController =
    TextEditingController(text: _criteria[index]['marks'].toString());

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Edit Criteria"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: editNameController,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: editMarksController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Marks"),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              final String newName = editNameController.text.trim();
              final int? newMarks = int.tryParse(editMarksController.text);
              if (newName.isNotEmpty && newMarks != null && newMarks > 0) {
                setState(() {
                  _criteria[index]['name'] = newName;
                  _criteria[index]['marks'] = newMarks;
                });
                Navigator.pop(context);
              }
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  void _proceedToStudents() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EvaluateStudentsScreen(
          courseName: widget.courseName,
          criteria: _criteria,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF0A73B7);

    return Scaffold(
      appBar: AppBar(
        title: Text("Set Criteria - ${widget.courseName}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "Add Marking Components (Total = 100)",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Add form for new criteria
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: "Component Name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: TextField(
                    controller: _marksController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Marks",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _addCriteria,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                  ),
                  child: const Text("Add", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // List of added criteria
            Expanded(
              child: ListView.builder(
                itemCount: _criteria.length,
                itemBuilder: (context, index) {
                  final item = _criteria[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      title: Text("${item['name']} - ${item['marks']} marks"),
                      trailing: IconButton(
                        icon: const Icon(Icons.edit, color: primaryColor),
                        onPressed: () => _editCriteria(index),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 10),
            Text(
              "Total Marks: $totalMarks / 100",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: totalMarks == 100 ? Colors.green : Colors.red,
              ),
            ),

            const SizedBox(height: 20),

            // Proceed Button (visible but disabled until total = 100)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: totalMarks == 100 ? _proceedToStudents : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                  totalMarks == 100 ? primaryColor : Colors.grey,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text(
                  "Proceed to Students",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

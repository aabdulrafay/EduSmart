import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ExportAttendanceScreen extends StatefulWidget {
  const ExportAttendanceScreen({super.key});

  @override
  State<ExportAttendanceScreen> createState() => _ExportAttendanceScreenState();
}

class _ExportAttendanceScreenState extends State<ExportAttendanceScreen> {
  final String teacherName = 'Mr. Ali Khan';
  final String teacherEmail = 'teacher@riphah.edu.pk';
  final String session = 'Fall 2025';

  final Map<String, Map<String, List<Map<String, String>>>> attendanceData = {
    'Mobile Application Development': {
      '2025-10-01': [
        {'id': '101', 'name': 'Ali', 'status': 'P'},
        {'id': '102', 'name': 'Hassan', 'status': 'A'},
        {'id': '103', 'name': 'Sara', 'status': 'P'},
      ],
      '2025-10-08': [
        {'id': '101', 'name': 'Ali', 'status': 'A'},
        {'id': '102', 'name': 'Hassan', 'status': 'P'},
        {'id': '103', 'name': 'Sara', 'status': 'P'},
      ],
      '2025-10-15': [
        {'id': '101', 'name': 'Ali', 'status': 'P'},
        {'id': '102', 'name': 'Hassan', 'status': 'P'},
        {'id': '103', 'name': 'Sara', 'status': 'A'},
      ],
    },
    'Web Programming': {
      '2025-10-02': [
        {'id': '201', 'name': 'Usman', 'status': 'P'},
        {'id': '202', 'name': 'Rafay', 'status': 'A'},
        {'id': '203', 'name': 'Ayesha', 'status': 'P'},
      ],
    },
  };

  final Map<String, String> classTimings = {
    'Mobile Application Development': '09:00 AM - 10:00 AM',
    'Web Programming': '10:00 AM - 11:00 AM',
  };

  String? selectedCourse;

  Future<void> _generatePdf(BuildContext context) async {
    if (selectedCourse == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a course first')),
      );
      return;
    }

    final course = selectedCourse!;
    final classTime = classTimings[course]!;
    final pdf = pw.Document();

    final dates = attendanceData[course]!.keys.toList()..sort();

    // Collect all unique students
    final students = attendanceData[course]!.values
        .expand((list) => list)
        .fold<Map<String, String>>({}, (map, student) {
      map[student['id']!] = student['name']!;
      return map;
    });

    final headers = ['ID', 'Name', ...dates];

    final dataRows = students.entries.map((entry) {
      final id = entry.key;
      final name = entry.value;
      final statuses = dates.map((date) {
        final record = attendanceData[course]![date]!
            .firstWhere((s) => s['id'] == id, orElse: () => {'status': '-'});
        return record['status']!;
      }).toList();

      return [id, name, ...statuses];
    }).toList();

    pdf.addPage(
      pw.MultiPage(
        orientation: pw.PageOrientation.landscape,
        margin: const pw.EdgeInsets.all(20),
        build: (context) => [
          pw.Center(
            child: pw.Column(
              children: [
                pw.Text('Riphah International University',
                    style: pw.TextStyle(
                        fontSize: 18, fontWeight: pw.FontWeight.bold)),
                pw.SizedBox(height: 4),
                pw.Text('Session: $session', style: const pw.TextStyle(fontSize: 12)),
                pw.SizedBox(height: 6),
                pw.Text('Course: $course', style: const pw.TextStyle(fontSize: 12)),
                pw.Text('Teacher: $teacherName', style: const pw.TextStyle(fontSize: 12)),
                pw.Text('Class Time: $classTime',
                    style: const pw.TextStyle(fontSize: 12)),
                pw.SizedBox(height: 10),
              ],
            ),
          ),

          // ✅ Center + Auto-fit the table nicely
          pw.Center(
            child: pw.Container(
              alignment: pw.Alignment.center,
              child: pw.FittedBox(
                fit: pw.BoxFit.scaleDown,
                child: pw.Table.fromTextArray(
                  headers: headers,
                  data: dataRows,
                  border: pw.TableBorder.all(width: 0.5),
                  headerDecoration:
                  const pw.BoxDecoration(color: PdfColors.grey300),
                  headerStyle: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold, fontSize: 10),
                  cellStyle: const pw.TextStyle(fontSize: 9),
                  cellAlignment: pw.Alignment.center,
                ),
              ),
            ),
          ),

          pw.SizedBox(height: 10),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text('Exported by: $teacherEmail',
                  style: const pw.TextStyle(fontSize: 9)),
              pw.Text('Generated: ${DateTime.now().toLocal()}',
                  style: const pw.TextStyle(fontSize: 9)),
            ],
          ),
        ],
        footer: (context) => pw.Align(
          alignment: pw.Alignment.centerRight,
          child: pw.Text(
            'Page ${context.pageNumber}',
            style: const pw.TextStyle(fontSize: 9),
          ),
        ),
      ),
    );

    final fileName = '${course.replaceAll(' ', '_')}_$session.pdf';

    await Printing.layoutPdf(
      name: fileName,
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Export Attendance Report'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
      ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Select Course'),
              value: selectedCourse,
              items: attendanceData.keys
                  .map((course) =>
                  DropdownMenuItem(value: course, child: Text(course)))
                  .toList(),
              onChanged: (value) => setState(() => selectedCourse = value),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.picture_as_pdf),
              label: const Text('Export Report as PDF'),
              style: ElevatedButton.styleFrom(
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
              onPressed: () => _generatePdf(context),
            ),
          ],
        ),
      ),
    );
  }
}

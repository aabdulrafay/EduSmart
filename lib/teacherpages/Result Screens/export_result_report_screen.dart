import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ExportResultReportScreen extends StatefulWidget {
  const ExportResultReportScreen({super.key});

  @override
  State<ExportResultReportScreen> createState() =>
      _ExportResultReportScreenState();
}

class _ExportResultReportScreenState extends State<ExportResultReportScreen> {
  final String teacherName = 'Mr. Ali Khan';
  final String teacherEmail = 'teacher@riphah.edu.pk';
  final String session = 'Fall 2025';

  final Map<String, List<Map<String, dynamic>>> resultData = {
    'Mobile Application Development': [
      {'id': '101', 'name': 'Ali', 'quiz': 20, 'assignment': 25, 'mid': 25, 'final': 30},
      {'id': '102', 'name': 'Hassan', 'quiz': 18, 'assignment': 20, 'mid': 22, 'final': 25},
      {'id': '103', 'name': 'Sara', 'quiz': 25, 'assignment': 28, 'mid': 24, 'final': 20},
    ],
    'Web Programming': [
      {'id': '201', 'name': 'Usman', 'quiz': 15, 'assignment': 20, 'mid': 30, 'final': 35},
      {'id': '202', 'name': 'Rafay', 'quiz': 22, 'assignment': 25, 'mid': 20, 'final': 30},
      {'id': '203', 'name': 'Ayesha', 'quiz': 28, 'assignment': 30, 'mid': 20, 'final': 22},
    ],
  };

  String? selectedCourse;

  String getGrade(double total) {
    if (total >= 85) return 'A';
    if (total >= 70) return 'B';
    if (total >= 60) return 'C';
    if (total >= 50) return 'D';
    return 'F';
  }

  Future<void> _generatePdf(BuildContext context) async {
    if (selectedCourse == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a course first')),
      );
      return;
    }

    final course = selectedCourse!;
    final pdf = pw.Document();

    final headers = ['ID', 'Name', 'Quiz', 'Assignment', 'Mid', 'Final', 'Total', 'Grade'];

    final dataRows = resultData[course]!.map((student) {
      final total = (student['quiz'] + student['assignment'] + student['mid'] + student['final']).toDouble();
      final grade = getGrade(total);
      return [
        student['id'].toString(),
        student['name'],
        student['quiz'].toString(),
        student['assignment'].toString(),
        student['mid'].toString(),
        student['final'].toString(),
        total.toStringAsFixed(1),
        grade,
      ];
    }).toList();

    pdf.addPage(
      pw.MultiPage(
        margin: const pw.EdgeInsets.all(20),
        build: (context) => [
          pw.Center(
            child: pw.Column(
              children: [
                pw.Text('Riphah International University',
                    style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
                pw.SizedBox(height: 4),
                pw.Text('Result Report - $session', style: const pw.TextStyle(fontSize: 12)),
                pw.SizedBox(height: 6),
                pw.Text('Course: $course', style: const pw.TextStyle(fontSize: 12)),
                pw.Text('Teacher: $teacherName', style: const pw.TextStyle(fontSize: 12)),
                pw.SizedBox(height: 10),
              ],
            ),
          ),
          pw.Center(
            child: pw.Container(
              alignment: pw.Alignment.center,
              child: pw.FittedBox(
                fit: pw.BoxFit.scaleDown,
                child: pw.Table.fromTextArray(
                  headers: headers,
                  data: dataRows,
                  border: pw.TableBorder.all(width: 0.5),
                  headerDecoration: const pw.BoxDecoration(color: PdfColors.grey300),
                  headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10),
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
              pw.Text('Exported by: $teacherEmail', style: const pw.TextStyle(fontSize: 9)),
              pw.Text('Generated: ${DateTime.now().toLocal()}', style: const pw.TextStyle(fontSize: 9)),
            ],
          ),
        ],
        footer: (context) => pw.Align(
          alignment: pw.Alignment.centerRight,
          child: pw.Text('Page ${context.pageNumber}', style: const pw.TextStyle(fontSize: 9)),
        ),
      ),
    );

    final fileName = '${course.replaceAll(' ', '_')}_Result_$session.pdf';
    await Printing.layoutPdf(name: fileName, onLayout: (PdfPageFormat format) async => pdf.save());
  }

  @override
  Widget build(BuildContext context) {
    const primaryBlue = Color(0xFF0A73B7);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Export Result Report'),
        backgroundColor: Colors.white,
        foregroundColor: primaryBlue,
        elevation: 1,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Select Course'),
              value: selectedCourse,
              items: resultData.keys
                  .map((course) => DropdownMenuItem(value: course, child: Text(course)))
                  .toList(),
              onChanged: (value) => setState(() => selectedCourse = value),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.picture_as_pdf),
              label: const Text('Export Result as PDF'),
              onPressed: () => _generatePdf(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryBlue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                textStyle: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
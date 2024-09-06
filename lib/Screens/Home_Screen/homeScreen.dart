import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gradle_kalpesh/Screens/AssignmentScreen/assignment_Screen.dart';

import '../../Repo/attendance_repo.dart';
import '../../model/attendance_model.dart';
import 'Widgets/customContainer.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});
  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController attendedController = TextEditingController(text: "0");
  final TextEditingController notAttendedController = TextEditingController(text: "0");

  @override
  void dispose() {
    subjectController.dispose();
    attendedController.dispose();
    notAttendedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final attendanceList = ref.watch(attendanceProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAttendanceDialog(context),
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => ref.read(attendanceProvider.notifier).markAllPresent(),
                  child: const Text('Mark All Present'),
                ),
                ElevatedButton(
                  onPressed: () => ref.read(attendanceProvider.notifier).markAllAbsent(),
                  child: const Text('Mark All Absent'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: attendanceList.length,
              itemBuilder: (context, index) {
                final subject = attendanceList[index];
                return CustomContainer(
                  subName: subject.subjectName,
                  percentage: '${subject.percentage?.toStringAsFixed(2)}%',
                  addPress: () async {
                    ref.read(attendanceProvider.notifier).addPresent(subject.subjectName);
                  },
                  minusPress: () async {
                    ref.read(attendanceProvider.notifier).addAbsent(subject.subjectName);
                  },
                  deletePress: () async {
                    ref.read(attendanceProvider.notifier).deleteSubject(subject.subjectName);
                  },
                  absent: subject.absent?.toString() ?? '0',
                  present: subject.present?.toString() ?? '0',
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showAttendanceDialog(BuildContext context) {
    subjectController.clear();
    attendedController.clear();
    notAttendedController.clear();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter Attendance Details'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: subjectController,
                  decoration: const InputDecoration(labelText: 'Subject Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a subject name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: attendedController,
                  decoration: const InputDecoration(labelText: 'Attended Lectures'),
                  keyboardType: TextInputType.number,
                ),
                TextFormField(
                  controller: notAttendedController,
                  decoration: const InputDecoration(labelText: 'Not Attended Lectures'),
                  keyboardType: TextInputType.number,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AssignmentPage()));
                  },
                  child: const Text('assignment'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  final subject = AttendanceModel(
                    subjectName: subjectController.text,
                    absent: int.tryParse(notAttendedController.text) ?? 0,
                    present: int.tryParse(attendedController.text) ?? 0,
                  );

                  ref.read(attendanceProvider.notifier).upsertSubject(subject);
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AssignmentPage()));
                }
              },
              child: const Text('Submit'),
            ),
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gradle_kalpesh/Screens/AssignmentScreen/assingnment_nav.dart';
import 'package:gradle_kalpesh/Screens/AssignmentScreen/widgets/assignment_dialog.dart';

class AssignmentPage extends ConsumerWidget {
  const AssignmentPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Assignments'),
        ),
        body: const assNav(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showAddAssignmentDialog(context, ref),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  void _showAddAssignmentDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => const AddAssignmentDialog(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gradle_kalpesh/Repo/assignment_repo.dart';
import 'package:gradle_kalpesh/Screens/AssignmentScreen/widgets/detail_dialog.dart';
import 'package:gradle_kalpesh/Theme/theme.dart';
import 'package:gradle_kalpesh/model/assignment.dart';
import 'package:intl/intl.dart';

class AssignmentList extends ConsumerWidget {
  final AssignmentStatus status;

  const AssignmentList({super.key, required this.status});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assignments = ref.watch(assignmentsProvider);
    final filteredAssignments = status == AssignmentStatus.all ? assignments : assignments.where((a) => a.status == status).toList();

    return ListView.builder(
      itemCount: filteredAssignments.length,
      itemBuilder: (context, index) {
        final assignment = filteredAssignments[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          color: _getCardColor(assignment),
          child: ListTile(
            title: Text(assignment.title),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(assignment.status.toString().split('.').last),
                Text('Deadline: ${DateFormat('yyyy-MM-dd').format(assignment.deadline)}'),
              ],
            ),
            onTap: () => _showAssignmentDetails(context, assignment),
          ),
        );
      },
    );
  }

  Color _getCardColor(Assignment assignment) {
    if (assignment.status == AssignmentStatus.submitted) {
      return AppTheme.buttonColor;
    } else if (assignment.isOverdue) {
      return Colors.red;
    }
    return AppTheme.containerColor;
  }

  void _showAssignmentDetails(BuildContext context, Assignment assignment) {
    showDialog(
      context: context,
      builder: (context) => AssignmentDetailsDialog(assignment: assignment),
    );
  }
}

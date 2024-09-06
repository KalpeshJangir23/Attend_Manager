import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gradle_kalpesh/Repo/assignment_repo.dart';
import 'package:gradle_kalpesh/model/assignment.dart';
import 'package:intl/intl.dart';

class AssignmentDetailsDialog extends ConsumerWidget {
  final Assignment assignment;

  const AssignmentDetailsDialog({super.key, required this.assignment});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: Text(assignment.title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Status: ${assignment.status.toString().split('.').last}'),
          Text('Deadline: ${DateFormat('yyyy-MM-dd').format(assignment.deadline)}'),
          const SizedBox(height: 16),
          const Text('Description:'),
          Text(assignment.description),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Close'),
        ),
        if (assignment.status == AssignmentStatus.pending)
          ElevatedButton(
            onPressed: () {
              ref.read(assignmentsProvider.notifier).updateAssignmentStatus(
                    assignment.id,
                    AssignmentStatus.submitted,
                  );
              Navigator.of(context).pop();
            },
            child: const Text('Mark as Submitted'),
          ),
      ],
    );
  }
}

// Providers
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gradle_kalpesh/model/assignment.dart';

final assignmentsProvider = StateNotifierProvider<AssignmentsNotifier, List<Assignment>>((ref) {
  return AssignmentsNotifier();
});

class AssignmentsNotifier extends StateNotifier<List<Assignment>> {
  AssignmentsNotifier() : super([]);

  void addAssignment(String title, String description, DateTime deadline) {
    final newAssignment = Assignment(
      id: DateTime.now().toString(),
      title: title,
      description: description,
      status: AssignmentStatus.pending,
      deadline: deadline,
    );
    state = [...state, newAssignment];
  }

  void updateAssignmentStatus(String id, AssignmentStatus newStatus) {
    state = [
      for (final assignment in state)
        if (assignment.id == id)
          Assignment(
            id: assignment.id,
            title: assignment.title,
            description: assignment.description,
            status: newStatus,
            deadline: assignment.deadline,
          )
        else
          assignment,
    ];
  }
}

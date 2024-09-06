// Models
class Assignment {
  final String id;
  final String title;
  final String description;
  final AssignmentStatus status;
  final DateTime deadline;

  Assignment({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.deadline,
  });

  bool get isOverdue => DateTime.now().isAfter(deadline) && status != AssignmentStatus.submitted;
}

enum AssignmentStatus { submitted, pending, all }

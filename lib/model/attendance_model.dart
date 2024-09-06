class AttendanceModel {
  final String subjectName;
  final int? present;
  final int? absent;
  final double? percentage;

  AttendanceModel({
    required this.subjectName,
    this.present,
    this.absent,
    this.percentage,
  });

  AttendanceModel copyWith({
    String? subjectName,
    int? present,
    int? absent,
  }) {
    int newPresent = present ?? this.present ?? 0;
    int newAbsent = absent ?? this.absent ?? 0;
    int total = newPresent + newAbsent;
    double newPercentage = total > 0 ? (newPresent / total) * 100 : 0.0;

    return AttendanceModel(
      subjectName: subjectName ?? this.subjectName,
      present: newPresent,
      absent: newAbsent,
      percentage: newPercentage,
    );
  }
}

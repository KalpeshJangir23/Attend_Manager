import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/attendance_model.dart';

final attendanceProvider = StateNotifierProvider<AttendanceRepoNotifier, List<AttendanceModel>>(
  (ref) => AttendanceRepoNotifier(),
);

class AttendanceRepoNotifier extends StateNotifier<List<AttendanceModel>> {
  AttendanceRepoNotifier() : super([]);

  void upsertSubject(AttendanceModel newSubject) {
    final existingIndex = state.indexWhere((subject) => subject.subjectName == newSubject.subjectName);
    if (existingIndex != -1) {
      state = [
        ...state.sublist(0, existingIndex),
        newSubject,
        ...state.sublist(existingIndex + 1),
      ];
    } else {
      state = [...state, newSubject];
    }
  }

  void updateAttendance(String name, int present, int absent) {
    state = state.map((subject) {
      if (subject.subjectName == name) {
        return subject.copyWith(present: present, absent: absent);
      }
      return subject;
    }).toList();
  }

  void addPresent(String name) {
    state = state.map((subject) {
      if (subject.subjectName == name) {
        return subject.copyWith(present: (subject.present ?? 0) + 1);
      }
      return subject;
    }).toList();
  }

  void addAbsent(String name) {
    state = state.map((subject) {
      if (subject.subjectName == name) {
        return subject.copyWith(absent: (subject.absent ?? 0) + 1);
      }
      return subject;
    }).toList();
  }

  void deleteSubject(String name) {
    state = state.where((subject) => subject.subjectName != name).toList();
  }

  void markAllPresent() {
    state = state.map((subject) {
      return subject.copyWith(present: (subject.present ?? 0) + 1);
    }).toList();
  }

  void markAllAbsent() {
    state = state.map((subject) {
      return subject.copyWith(absent: (subject.absent ?? 0) + 1);
    }).toList();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gradle_kalpesh/Repo/assignment_repo.dart';
import 'package:intl/intl.dart';

class AddAssignmentDialog extends ConsumerStatefulWidget {
  const AddAssignmentDialog({super.key});

  @override
  _AddAssignmentDialogState createState() => _AddAssignmentDialogState();
}

class _AddAssignmentDialogState extends ConsumerState<AddAssignmentDialog> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Assignment'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          TextField(
            controller: _descriptionController,
            decoration: const InputDecoration(labelText: 'Description'),
            maxLines: 3,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Text('Deadline: ${DateFormat('yyyy-MM-dd').format(_selectedDate)}'),
              const SizedBox(width: 2),
              ElevatedButton(
                onPressed: () => _selectDate(context),
                child: const Text('Select Date'),
              ),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_titleController.text.isNotEmpty) {
              ref.read(assignmentsProvider.notifier).addAssignment(
                    _titleController.text,
                    _descriptionController.text,
                    _selectedDate,
                  );
              Navigator.of(context).pop();
            }
          },
          child: const Text(
            'Add',
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}

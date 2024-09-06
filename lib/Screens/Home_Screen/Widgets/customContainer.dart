import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String subName;
  final String percentage;
  final VoidCallback addPress;
  final VoidCallback minusPress;
  final VoidCallback deletePress; // Add deletePress callback
  final String absent;
  final String present;

  const CustomContainer({
    super.key,
    required this.subName,
    required this.addPress,
    required this.minusPress,
    required this.deletePress, // Add deletePress callback
    required this.absent,
    required this.present,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(subName),
        subtitle: Text('Present: $present, Absent: $absent'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(percentage),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: addPress,
            ),
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: minusPress,
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: deletePress, // Use deletePress callback
            ),
          ],
        ),
      ),
    );
  }
}

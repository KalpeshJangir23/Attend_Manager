// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'package:flutter/material.dart';

class RowContainer extends StatelessWidget {
  final String display_data;
  final String label;
  const RowContainer({
    super.key,
    required this.display_data,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Text(display_data),
            Text(label),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class RowText extends StatelessWidget {
  const RowText({super.key, required this.title, required this.label});
  final String title;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(label),
      ],
    );
  }
}

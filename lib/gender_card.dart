import 'package:flutter/material.dart';

const textStyle = TextStyle(fontSize: 20.0, color: Color(0xFF355E3B));
const iconColor = Color(0xFF355E3B);
const iconSize = 80.0;

class GenderCard extends StatelessWidget {
  const GenderCard({required this.icon, required this.text});

  final IconData? icon;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: iconColor, size: iconSize),
        SizedBox(height: 10.0),
        Text('$text', style: textStyle),
      ],
    );
  }
}

import 'package:flutter/material.dart';


class GenderCard extends StatelessWidget {
  const GenderCard({required this.icon, required this.text});

  final IconData? icon;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.green[300], size: 80.0),
        SizedBox(height: 10.0),
        Text(
          '$text',
          style: TextStyle(fontSize: 20.0, color: Colors.green[300]),
        ),
      ],
    );
  }
}

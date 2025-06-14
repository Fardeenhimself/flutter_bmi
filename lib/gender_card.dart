import 'package:flutter/material.dart';
import 'constants.dart';

class GenderCard extends StatelessWidget {
  const GenderCard({super.key, required this.icon, required this.text});

  final IconData? icon;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: iconColor, size: kIconSize),
        SizedBox(height: 10.0),
        Text('$text', style: kTextStyle),
      ],
    );
  }
}


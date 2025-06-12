import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  const Buttons({
    super.key,
    required this.iconMinus,
    required this.weight,
    required this.iconPlus,
  });

  final IconData? iconMinus;
  final int? weight;
  final IconData? iconPlus;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(iconMinus),
        Text(
          '$weight',
          style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.w900),
        ),
        Icon(iconPlus),
      ],
    );
  }
}

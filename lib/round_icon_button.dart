import 'package:flutter/material.dart';

int currentWeight = 61;
int currentAge = 18;

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({required this.icon, required this.onPressed});

  final IconData? icon;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: CircleBorder(),
      fillColor: Color(0xFF355E3B),
      child: Icon(icon, color: Color(0xFF50C878)),
    );
  }
}

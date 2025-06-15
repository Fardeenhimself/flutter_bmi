import 'package:flutter/material.dart';
import '../constants.dart';

class ChooseWeightButton extends StatelessWidget {
  const ChooseWeightButton({
    required this.weightName,
    required this.weightScale,
  });

  final String? weightName;
  final VoidCallback? weightScale;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: weightScale,
      constraints: BoxConstraints.tightFor(width: 40.0),
      child: Text('$weightName', style: kWeightButtonStyle),
    );
  }
}

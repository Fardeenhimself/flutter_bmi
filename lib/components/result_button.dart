import 'package:flutter/material.dart';
import '../constants.dart';

class ResultButton extends StatelessWidget {
  ResultButton({required this.onTap, required this.buttonText});

  final VoidCallback? onTap;
  final String? buttonText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Color(0xFF91f086),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
        child: Center(child: Text('$buttonText', style: kCalculateButtonStyle)),
      ),
    );
  }
}

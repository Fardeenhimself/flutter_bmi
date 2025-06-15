import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import '../components/custom_card.dart';
import '../components/result_button.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key, 
    required this.showResult,
    required this.showValue,
    required this.showSummary,
  });

  final String? showResult;
  final String? showValue;
  final String? showSummary;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI CALCULATOR')),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.bottomLeft,
                child: Text('Your Results:', style: kResultTitleStyle),
              ),
              Expanded(
                flex: 5,
                child: CustomCard(
                  colour: Color(0xFFd3ffce),
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        '${showResult?.toUpperCase()}',
                        style: kDecisionText,
                      ),
                      Text('$showValue', style: kResultStyle),
                      Text(
                        '$showSummary',
                        style: kResultSummaryStyle,
                        textAlign: TextAlign.center,
                      ),
                      Text('Normal range ~18.5 - 25 ', style: kDecisionText),
                    ],
                  ),
                ),
              ),
              ResultButton(
                onTap: () {
                  Navigator.pop(context);
                },
                buttonText: 'RE-CALCULATE',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

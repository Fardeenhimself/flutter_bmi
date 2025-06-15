import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import '../components/custom_card.dart';
import '../components/result_button.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

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
                      Text('Normal', style: kDecisionText),
                      Text('18.8', style: kResultStyle),
                      Text(
                        'Your BMI is low. Maintain proper diet.',
                        style: kResultSummaryStyle,
                        textAlign: TextAlign.center,
                      ),
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

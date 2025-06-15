import 'package:bmi_calculator/components/choose_weight_button.dart';
import 'package:flutter/material.dart';
import '../components/custom_card.dart';
import '../components/gender_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';
import '../components/round_icon_button.dart';
import '../components/result_button.dart';
import 'results_page.dart';
import 'package:bmi_calculator/bmi_brain.dart';

enum GenderType { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType? selectedGender;

  bool isKgSelected = true;
  int currentKgWeight = 60;
  int currentLbWeight = 132;
  int currentAge = 18;

  double currentSlidervalue = 170;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI CALCULATOR')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: CustomCard(
                        onPress: () {
                          setState(() {
                            selectedGender = GenderType.male;
                          });
                        },
                        cardChild: GenderCard(
                          icon: FontAwesomeIcons.mars,
                          text: 'MALE',
                        ),
                        colour: selectedGender == GenderType.male
                            ? kActiveCardColour
                            : kInactiveCardColor,
                      ),
                    ),
                    Expanded(
                      child: CustomCard(
                        onPress: () {
                          setState(() {
                            selectedGender = GenderType.female;
                          });
                        },
                        cardChild: GenderCard(
                          icon: FontAwesomeIcons.venus,
                          text: 'FEMALE',
                        ),
                        colour: selectedGender == GenderType.female
                            ? kActiveCardColour
                            : kInactiveCardColor,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: CustomCard(
                  colour: kInactiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('HEIGHT', style: kTextStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '${currentSlidervalue.round()}',
                            style: kHeightNumberStyle,
                          ),
                          Text('cm', style: kTextStyle),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Color(0xFF50C878),
                          inactiveTrackColor: Color(0xFF355E3B),
                          thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 15.0,
                          ),
                          overlayShape: RoundSliderOverlayShape(
                            overlayRadius: 25.0,
                          ),
                          thumbColor: Color(0xFF50C878),
                        ),
                        child: Slider(
                          value: currentSlidervalue,
                          min: 55,
                          max: 200,
                          onChanged: (double value) {
                            setState(() {
                              currentSlidervalue = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: CustomCard(
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('WEIGHT', style: kTextStyle),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      if (isKgSelected == true) {
                                        if (currentKgWeight > 0) {
                                          currentKgWeight--;
                                        }
                                      } else {
                                        if (currentLbWeight > 0) {
                                          currentLbWeight--;
                                        }
                                      }
                                    });
                                  },
                                ),
                                Expanded(
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      isKgSelected
                                          ? '$currentKgWeight'
                                          : '$currentLbWeight',
                                      style: kHeightNumberStyle,
                                    ),
                                  ),
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      if (isKgSelected == true) {
                                        if (currentKgWeight < 500) {
                                          currentKgWeight++;
                                        }
                                      } else {
                                        if (currentLbWeight < 1000) {
                                          currentLbWeight++;
                                        }
                                      }
                                    });
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ChooseWeightButton(
                                  weightName: 'Kg',
                                  weightScale: () {
                                    setState(() {
                                      isKgSelected = true;
                                    });
                                  },
                                ),
                                Text('/', style: kWeightButtonStyle),
                                ChooseWeightButton(
                                  weightName: 'Lb',
                                  weightScale: () {
                                    setState(() {
                                      isKgSelected = false;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        colour: kInactiveCardColor,
                      ),
                    ),
                    Expanded(
                      child: CustomCard(
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('AGE', style: kTextStyle),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.ideographic,
                              children: [
                                Text('$currentAge', style: kHeightNumberStyle),
                                Text('Y/O', style: kTextStyle),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      if (currentAge > 4) {
                                        currentAge--;
                                      }
                                    });
                                  },
                                ),

                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      if (currentAge < 100) {
                                        currentAge++;
                                      }
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        colour: kInactiveCardColor,
                      ),
                    ),
                  ],
                ),
              ),
              ResultButton(
                onTap: () {
                  BmiBrain calculate = BmiBrain(
                    height: currentSlidervalue,
                    weightInKg: currentKgWeight,
                    weightInLb: currentLbWeight,
                  );

                  final bmiResult = isKgSelected
                      ? calculate.bmiForKg()
                      : calculate.bmiForLb();

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ResultsPage(
                          showValue: bmiResult,
                          showResult: calculate.getResult(),
                          showSummary: calculate.getSummary(),
                        );
                      },
                    ),
                  );
                },
                buttonText: 'CALCULATE',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

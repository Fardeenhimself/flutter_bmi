import 'package:flutter/material.dart';
import 'custom_card.dart';
import 'gender_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'round_icon_button.dart';
import 'result_button.dart';
import 'results_page.dart';

enum GenderType { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType? selectedGender;

  double currentSlidervalue = 170;

  // Color maleCardColour = inactiveCardColor;
  // Color femaleCardColour = inactiveCardColor;

  // void updateCardColor(gender) {
  //   if (gender == GenderType.male) {
  //     if (maleCardColour == inactiveCardColor) {
  //       maleCardColour = activeCardColour;
  //       femaleCardColour = inactiveCardColor;
  //     } else {
  //       maleCardColour = inactiveCardColor;
  //     }
  //   } else if (gender == GenderType.female) {
  //     if (femaleCardColour == inactiveCardColor) {
  //       femaleCardColour = activeCardColour;
  //       maleCardColour = inactiveCardColor;
  //     } else {
  //       femaleCardColour = inactiveCardColor;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Calculator')),
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
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  '$currentWeight',
                                  style: kHeightNumberStyle,
                                ),
                                Text('KG', style: kTextStyle),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      if (currentWeight > 0) {
                                        currentWeight--;
                                      }
                                    });
                                  },
                                ),
                                SizedBox(width: 10.0),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      if (currentWeight < 500) {
                                        currentWeight++;
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
                    Expanded(
                      child: CustomCard(
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('AGE', style: kTextStyle),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
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
                                SizedBox(width: 10.0),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ResultsPage();
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

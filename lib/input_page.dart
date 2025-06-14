import 'package:flutter/material.dart';
import 'custom_card.dart';
import 'gender_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'buttons.dart';

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
      appBar: AppBar(title: Text('BMI Calculator'), centerTitle: true),
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
                        colour: kInactiveCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('WEIGHT', style: kTextStyle),
                            Buttons(
                              iconMinus: FontAwesomeIcons.squareMinus,
                              weight: 50,
                              iconPlus: FontAwesomeIcons.squarePlus,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(child: CustomCard(colour: kInactiveCardColor)),
                  ],
                ),
              ),
              Container(
                color: Color(0xFF91f086),
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: kBottomContainerHeight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

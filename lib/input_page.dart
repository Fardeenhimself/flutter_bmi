import 'package:flutter/material.dart';
import 'custom_card.dart';
import 'gender_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const bottomContainerHeight = 80.0;
const activeCardColour = Color(0xFFd3ffce);

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Calculator'), centerTitle: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: CustomCard(
                        cardChild: GenderCard(
                          icon: FontAwesomeIcons.mars,
                          text: 'MALE',
                        ),
                        colour: activeCardColour,
                      ),
                    ),
                    Expanded(
                      child: CustomCard(
                        cardChild: GenderCard(
                          icon: FontAwesomeIcons.venus,
                          text: 'FEMALE',
                        ),
                        colour: activeCardColour,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: CustomCard(colour: activeCardColour)),
              Expanded(
                child: Row(
                  children: [
                    Expanded(child: CustomCard(colour: activeCardColour)),
                    Expanded(child: CustomCard(colour: activeCardColour)),
                  ],
                ),
              ),
              Container(
                color: Color(0xFF91f086),
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: bottomContainerHeight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

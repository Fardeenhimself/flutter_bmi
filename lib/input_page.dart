import 'package:flutter/material.dart';
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

class GenderCard extends StatelessWidget {
  const GenderCard({required this.icon, required this.text});

  final IconData? icon;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.green[300], size: 80.0),
        SizedBox(height: 10.0),
        Text(
          '$text',
          style: TextStyle(fontSize: 20.0, color: Colors.green[300]),
        ),
      ],
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({required this.colour, this.cardChild});

  final Color? colour;
  final Widget? cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: cardChild,
    );
  }
}

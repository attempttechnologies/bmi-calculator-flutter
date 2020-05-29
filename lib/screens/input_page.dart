import 'file:///C:/Users/limaj/AndroidStudioProjects/bmi-calculator-flutter/lib/screens/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import '../components/bottom_button.dart';
import '../components/round_icon.dart';
import 'package:bmi_calculator/calculator_brain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { male, female }

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 21;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: new ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    color: selectedGender == Gender.male
                        ? kActiveColor
                        : kInactiveColor,
                    childCard: new IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: new ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    color: selectedGender == Gender.female
                        ? kActiveColor
                        : kInactiveColor,
                    childCard: new IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            )),
            Expanded(
              child: new ReusableCard(
                color: kInactiveColor,
                childCard: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          this.height.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                        overlayColor: Color(0x29EB1555),
                        inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                      ),
                      child: Slider(
                        value: this.height.toDouble(),
                        min: kMinHeightSlider,
                        max: kMaxHeightSlider,
                        onChanged: (double newValue) {
                          setState(() {
                            this.height = newValue.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: new ReusableCard(
                    color: kInactiveColor,
                    childCard: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            this.weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(
                                  onPressed: () {
                                    setState(() {
                                      this.weight--;
                                    });
                                  },
                                  icon: FontAwesomeIcons.minus,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                RoundIconButton(
                                  onPressed: () {
                                    setState(() {
                                      this.weight++;
                                    });
                                  },
                                  icon: FontAwesomeIcons.plus,
                                ),
                              ])
                        ]),
                  ),
                ),
                Expanded(
                  child: new ReusableCard(
                    color: kInactiveColor,
                    childCard: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            this.age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(
                                  onPressed: () {
                                    setState(() {
                                      this.age--;
                                    });
                                  },
                                  icon: FontAwesomeIcons.minus,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                RoundIconButton(
                                  onPressed: () {
                                    setState(() {
                                      this.age++;
                                    });
                                  },
                                  icon: FontAwesomeIcons.plus,
                                ),
                              ]),
                        ]),
                  ),
                ),
              ],
            )),
            new BottomButton(
              buttonTitle: 'CALCULATE',
              onTap: () {
                CalculateBrain calc = new CalculateBrain(
                  height: this.height,
                  weight: this.weight,
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmiResult: calc.calculateBMI(),
                      resultText: calc.getResults(),
                      interpretation: calc.getInterpretation(),
                    ),
                  ),
                );
              },
            )
          ]),
    );
  }
}

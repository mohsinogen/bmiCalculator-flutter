import 'package:bmicalc/components/BlockButton.dart';
import 'package:bmicalc/constants.dart';
import 'package:bmicalc/screens/ResultsPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/GenderCard.dart';
import '../components/CardComponent.dart';
import '../components/RoundButton.dart';
import '../calculator_logic.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;

  Gender? currentGender;
  int height = 120;
  int weight = 60;
  int age = 20;

  void updateColor(Gender gender) {
    if (gender == Gender.male) {
      if (maleCardColor == activeCardColor) {
        maleCardColor = inactiveCardColor;
      } else {
        maleCardColor = activeCardColor;
        femaleCardColor = inactiveCardColor;
      }
    } else {
      if (femaleCardColor == activeCardColor) {
        femaleCardColor = inactiveCardColor;
      } else {
        femaleCardColor = activeCardColor;
        maleCardColor = inactiveCardColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0E21),
        title: const Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CardComponent(
                    tapHandler: () {
                      setState(() {
                        currentGender = Gender.male;
                      });
                    },
                    bgColor: currentGender == Gender.male
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: const GenderCard(
                      cardIcon: FontAwesomeIcons.mars,
                      gender: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: CardComponent(
                    tapHandler: () {
                      setState(() {
                        currentGender = Gender.female;
                      });
                    },
                    bgColor: currentGender == Gender.female
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: const GenderCard(
                      cardIcon: FontAwesomeIcons.venus,
                      gender: 'FEMALE',
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: CardComponent(
                tapHandler: () {},
                bgColor: activeCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'HEIGHT',
                      style: labelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '$height',
                          style: numTextStyle,
                        ),
                        const Text(
                          'CM',
                          style: labelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 15.0),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 30.0),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: const Color(0xFF8D8E98),
                        thumbColor: const Color(0xFFEB1555),
                        overlayColor: const Color(0x29EB1555),
                      ),
                      child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          onChanged: (double val) {
                            setState(() {
                              height = val.round();
                            });
                          }),
                    )
                  ],
                )),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: CardComponent(
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'WEIGHT',
                              style: labelTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  '$weight',
                                  style: numTextStyle,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundButton(
                                  tapHandler: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  icon: FontAwesomeIcons.plus,
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                RoundButton(
                                  tapHandler: () {
                                    if (weight > 1) {
                                      setState(() {
                                        weight--;
                                      });
                                    }
                                  },
                                  icon: FontAwesomeIcons.minus,
                                ),
                              ],
                            )
                          ],
                        ),
                        tapHandler: () {},
                        bgColor: activeCardColor)),
                Expanded(
                    child: CardComponent(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'AGE',
                        style: labelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '$age',
                            style: numTextStyle,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundButton(
                            tapHandler: () {
                              if (age < 100) {
                                setState(() {
                                  age++;
                                });
                              }
                            },
                            icon: FontAwesomeIcons.plus,
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          RoundButton(
                            tapHandler: () {
                              if (age > 1) {
                                setState(() {
                                  age--;
                                });
                              }
                            },
                            icon: FontAwesomeIcons.minus,
                          ),
                        ],
                      )
                    ],
                  ),
                  tapHandler: () {},
                  bgColor: activeCardColor,
                ))
              ],
            ),
          ),
           BlockButton(label: 'CALCULATE', tapHandler: (){
            CalculatorLogin calc = CalculatorLogin(height: height, weight: weight);

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ResultsPage(
                bmiResults: calc.calculateBMI(),
                interpretation: calc.getInterpretation(),
                resultText: calc.getResult(),
              ))
            );
          })
        ],
      )),
    );
  }
}

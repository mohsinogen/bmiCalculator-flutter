import 'package:bmicalc/components/BlockButton.dart';
import 'package:bmicalc/components/CardComponent.dart';
import 'package:bmicalc/constants.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage(
      {super.key,
      required this.bmiResults,
      required this.interpretation,
      required this.resultText});

  final String? bmiResults;
  final String? resultText;
  final String? interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0E21),
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Your Results',
                style: titleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: CardComponent(
              tapHandler: () {},
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText!.toUpperCase(),
                    style: resultTextStyle,
                  ),
                  Text(
                    bmiResults!,
                    style: bmiTextStyle,
                  ),
                  Text(
                    interpretation!,
                    style: bodyTextStyle,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              bgColor: activeCardColor,
            ),
          ),
          BlockButton(
              label: 'RE CALCULATE',
              tapHandler: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}

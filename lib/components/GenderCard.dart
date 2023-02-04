import 'package:bmicalc/constants.dart';
import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  const GenderCard({super.key, required this.gender, required this.cardIcon});

  final String gender;
  final IconData cardIcon;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(
        cardIcon,
        size: 80.0,
      ),
      const SizedBox(
        height: 15.0,
      ),
      Text(
        gender,
        style: labelTextStyle,
      )
    ]);
  }
}

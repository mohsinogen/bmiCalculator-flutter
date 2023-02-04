import 'package:flutter/material.dart';
import '../constants.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({super.key, required this.icon, required this.tapHandler});

  final IconData icon;
  final VoidCallback tapHandler;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      onPressed: tapHandler,
      shape: const CircleBorder(),
      fillColor: floatingBtnColor,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0
      ),
      child: Icon(icon, size: 35.0),
    );
  }
}
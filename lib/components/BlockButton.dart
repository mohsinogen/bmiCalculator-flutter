import 'package:flutter/material.dart';
import '../constants.dart';

class BlockButton extends StatelessWidget {
  const BlockButton({super.key, required this.label, required this.tapHandler});

  final String label;
  final VoidCallback tapHandler;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapHandler,
      child: Container(
        alignment: Alignment.center,
        color: bottomContainerColor,
        margin: const EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: bottomContainerHeight,
        child: Text(
          label,
          style: largeBtnTextStyle,
        ),
      ),
    );
  }
}

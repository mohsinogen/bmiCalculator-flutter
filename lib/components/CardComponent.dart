import 'package:flutter/material.dart';

class CardComponent extends StatelessWidget {
  CardComponent({super.key, required this.bgColor, this.cardChild, required this.tapHandler});

  final Color bgColor;
  final Widget? cardChild;
  final VoidCallback tapHandler;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: 
        tapHandler
      ,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), color: bgColor),
        margin: const EdgeInsets.all(15.0),
        child: cardChild,
      ),
    );
  }
}
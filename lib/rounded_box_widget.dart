import 'package:flutter/material.dart';

class RoundedBoxWidget extends StatelessWidget {
  const RoundedBoxWidget(
      {super.key,
      this.backgroundColor = const Color.fromRGBO(251, 109, 59, 0.1),
      this.borderColor = const Color.fromRGBO(251, 109, 59, 0.1),
      required this.firstText,
      required this.secondText,
      this.firstTxtColor = const Color(0xFFFB6D3B),
      this.secondTxtColor = const Color(0xFF2C2C2C)});

  final Color backgroundColor;
  final Color borderColor;
  final String firstText;
  final String secondText;
  final Color firstTxtColor;
  final Color secondTxtColor;

  @override
  Widget build(context) {
    return Center(
        child: Container(
      decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(width: 1.0, color: borderColor),
          borderRadius: BorderRadius.circular(8)),
      width: 360,
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
            child: Expanded(
                child: RichText(
          text: TextSpan(
              text: firstText,
              style: TextStyle(color: firstTxtColor),
              children: <TextSpan>[
                const TextSpan(text: " "),
                TextSpan(
                    text: secondText, style: TextStyle(color: secondTxtColor))
              ]),
        ))),
      ),
    ));
  }
}

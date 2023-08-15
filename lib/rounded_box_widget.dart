import 'package:flutter/material.dart';

class RoundedBoxWidget extends StatelessWidget {
  const RoundedBoxWidget(
      {super.key,
      this.backgroundColor = const Color.fromRGBO(251, 109, 59, 0.1),
      this.borderColor = const Color.fromRGBO(251, 109, 59, 0.1)});

  final Color backgroundColor;
  final Color borderColor;

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
            child: const Center(
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      /*Text(
                        "***",
                        style: TextStyle(color: Color(0xFFFB6D3B)),
                      ),*/
                      Expanded(
                          child: Text(
                        "*** Jelo moze sadrzati susam biber i riblje brasno u tragovima koje se deklarise kao alergen!!!",
                        style: TextStyle(color: Color(0xFF2C2C2C)),
                      ))
                    ],
                  )),
            )));
  }
}

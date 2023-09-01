import 'package:flutter/material.dart';
//import 'package:flutter_tasks/rounded_box_widget.dart';
import 'package:flutter_tasks/smart_scroll_bar.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
          body:
              SmartScrollBar() /*RoundedBoxWidget(
        firstText: "***",
        secondText:
            "Jelo može sadržati susam i riblje brašno u tragovima koje se deklariše kao alergen!!!",
      )*/
          ),
    ),
  );
}

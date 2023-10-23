import 'package:flutter/material.dart';
//import 'package:flutter_tasks/rounded_box_widget.dart';
//import 'package:flutter_tasks/smart_scroll_bar.dart';
//import 'package:flutter_tasks/map_widget.dart';
import 'package:flutter_tasks/language_widget.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => const HomeScreen(),
        "/languages": (context) => const LanguagesScreen(
              languageList: ["English", "Espanol", "German"],
            )
      },
      //home: Scaffold()
      //MapWidget(45.1469, 17.2547)
      //SmartScrollBar()//
      /*RoundedBoxWidget(
        firstText: "***",
        secondText:
            "Jelo može sadržati susam i riblje brašno u tragovima koje se deklariše kao alergen!!!",
      )*/
    ),
  );
}

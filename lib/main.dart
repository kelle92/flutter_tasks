//Import packages
import 'package:flutter/material.dart';
import 'package:flutter_tasks/rounded_box_widget.dart';

/* Potrebno da se nesto prikaze na ekranu
void main() {
  runApp();
}
*/

//Basic APP
void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(body: RoundedBoxWidget()),
    ),
  );
}

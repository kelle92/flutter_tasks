import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_map/flutter_map.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Screen")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, "/languages");
          },
          child: const Text("Languages"),
        ),
      ),
    );
  }
}

class LanguagesScreen extends StatelessWidget {
  const LanguagesScreen({super.key, this.languageList});

  final languageList;

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFFFB6D3B),
          title: Row(
            children: [
              const Text("Languages",
                  style: TextStyle(
                    color: Colors.white,
                  )),
              const Spacer(),
              RichText(
                  text: TextSpan(
                      text: "Update",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print("Update clicked");
                        }))
            ],
          )),
      body: Column(children: [
        Container(
          child: const Padding(
            padding: EdgeInsets.all(30),
            child:
                // Ovdje mora ici listviewbuilder!!!! za Svaki element
                Row(
              children: [
                Text("English"),
                Spacer(),
                Text("Checkbox"),
              ],
            ),
          ),
        )
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

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
  const LanguagesScreen(
      {super.key,
      this.languageList = const [],
      required this.defaultLanguage,
      this.defaultFunction});

  final List languageList;
  final String defaultLanguage;
  final void defaultFunction;

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
                            Navigator.pop(context, "/");
                          }))
              ],
            )),
        body: ListView.builder(
            padding: const EdgeInsets.all(35),
            scrollDirection: Axis.vertical,
            itemCount: languageList.length,
            itemBuilder: (context, int index) {
              return Container(
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 1.0, color: Colors.black))),
                  //height: 70,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25, bottom: 25),
                    child: Text(
                      "${languageList[index]}",
                      style:

                          //Simulacija kako odraditi checkbox pored default jezika

                          languageList[index] == defaultLanguage
                              ? const TextStyle(
                                  fontSize: 16, color: Color(0xFFFB6D3B))
                              : const TextStyle(
                                  fontSize: 16, color: Colors.black),
                    ),
                  ));
            }));
  }
}

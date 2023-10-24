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

class LanguagesScreen extends StatefulWidget {
  const LanguagesScreen(
      {super.key,
      this.languageList = const [],
      required this.defaultLanguage,
      this.defaultFunction});

  final List languageList;
  final String defaultLanguage;
  final void defaultFunction;

  @override
  State<LanguagesScreen> createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen> {
  late String selectedLanguage = widget.defaultLanguage;
  bool isChecked = true;

  void setSelectedLanguage(value) {
    setState(() {
      selectedLanguage = value;
    });
  }

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

                            //Default funkcija koja je proslijeđena kroz kontruktor
                            widget.defaultFunction;
                          }))
              ],
            )),
        body: ListView.builder(
            padding: const EdgeInsets.all(35),
            scrollDirection: Axis.vertical,
            itemCount: widget.languageList.length,
            itemBuilder: (context, int index) {
              return GestureDetector(
                child: Container(
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 1.0, color: Colors.black))),
                  child: widget.languageList[index] == selectedLanguage
                      ? Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 25, bottom: 25),
                              child: Text("${widget.languageList[index]}",
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.black)),
                            ),
                            const Spacer(),
                            Checkbox(
                                value: isChecked,
                                checkColor: const Color(0xFFFB6D3B),
                                onChanged: (value) {
                                  setState(() {});
                                })
                          ],
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 25, bottom: 25),
                          child: Text(
                            "${widget.languageList[index]}",
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black),
                          ),
                        ),
                ),
                onTap: () {
                  setSelectedLanguage(widget.languageList[index]);
                },
              );
            }));
  }
}

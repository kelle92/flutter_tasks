import 'package:flutter/material.dart';

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
      this.updateLanguage});

  final List languageList;
  final String defaultLanguage;
  final void updateLanguage;

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
                GestureDetector(
                  child: const Text(
                    "Update",
                    style: TextStyle(fontSize: 16),
                  ),
                  onTap: () {
                    Navigator.pop(context, "/");

                    //Default funkcija koja je proslijeđena kroz kontruktor
                    widget.updateLanguage;
                  },
                )
              ],
            )),
        body: ListView.builder(
            padding: const EdgeInsets.all(35),
            scrollDirection: Axis.vertical,
            itemCount: widget.languageList.length,
            itemBuilder: (context, int index) {
              return GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                      border: index == widget.languageList.length - 1
                          ? const Border(bottom: BorderSide.none)
                          : const Border(
                              bottom:
                                  BorderSide(width: 1.0, color: Colors.black))),
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
                                activeColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2.0),
                                ),
                                side: MaterialStateBorderSide.resolveWith(
                                  (states) => const BorderSide(
                                      width: 1.0, color: Color(0xFFFB6D3B)),
                                ),
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

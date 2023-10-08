import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

final List _meals = [
  ["Meal 1", "Meal 2"],
  ["Meal 1", "Meal 2", "Meal 3"],
  ["Meal 1", "Meal 2", "Meal 3", "Meal 4"],
  ["Meal 1", "Meal 2", "Meal 3", "Meal 4", "Meal 5"],
  ["Meal 1", "Meal 2", "Meal 3", "Meal 4", "Meal 5"],
  ["Meal 1", "Meal 2", "Meal 3", "Meal 4", "Meal 5"],
  ["Meal 1", "Meal 2", "Meal 3", "Meal 4", "Meal 5", "Meal 6", "Meal 7"],
  ["Meal 1", "Meal 2"],
  ["Meal 1", "Meal 2", "Meal 3"],
  ["Meal 1", "Meal 2", "Meal 3", "Meal 4"],
  ["Meal 1", "Meal 2", "Meal 3", "Meal 4", "Meal 5"],
  ["Meal 1", "Meal 2", "Meal 3", "Meal 4", "Meal 5"],
  ["Meal 1", "Meal 2", "Meal 3", "Meal 4", "Meal 5"],
  [
    "Meal 1",
    "Meal 2",
    "Meal 3",
    "Meal 4",
    "Meal 5",
    "Meal 6",
    "Meal 7",
    "Meal 8",
    "Meal 9"
  ],
];

Color themeColor = const Color(0xFFFB6D3B);
Color backgroundColor = Colors.white;
Color fontColor = const Color(0xFFFB6D3B);

class SmartScrollBar extends StatefulWidget {
  const SmartScrollBar({super.key});

  @override
  State<SmartScrollBar> createState() {
    return _SmartScrollBarState();
  }
}

class _SmartScrollBarState extends State<SmartScrollBar> {
  late List groupIndexList;
  late int visibleGroupIndex = 0;
  late int clickedGroupIndex = 0;
  late bool isClicked = false;

//Controllers
  final mealGroupController = ItemScrollController();
  final mealGroupListener = ItemPositionsListener.create();
  final groupTabController = ItemScrollController();

//Functions
  void scrollToMealGroup() {
    mealGroupController.scrollTo(
        index: clickedGroupIndex, duration: const Duration(milliseconds: 400));
  }

  void scrollToGroupTab(index) {
    groupTabController.scrollTo(
        index: index, duration: const Duration(milliseconds: 400));
  }

  void setGroupIndex(index) {
    setState(() {
      clickedGroupIndex = index;
    });
  }

  void setIsClicked(value) {
    setState(() {
      isClicked = value;
    });
  }

//
  @override
  void initState() {
    super.initState();

    mealGroupListener.itemPositions.addListener(() {
      groupIndexList = mealGroupListener.itemPositions.value
          .where((item) {
            final isTopVisible = item.itemLeadingEdge <= 0;
            return isTopVisible;
          })
          .map((item) => item.index)
          .toList();

      if (visibleGroupIndex != groupIndexList[0]) {
        visibleGroupIndex = groupIndexList[0];
        if (isClicked == false) {
          scrollToGroupTab(visibleGroupIndex);
          setGroupIndex(visibleGroupIndex);
        } else if (isClicked == true) {
          if (clickedGroupIndex == visibleGroupIndex) {
            scrollToGroupTab(visibleGroupIndex);
            setGroupIndex(visibleGroupIndex);
            setIsClicked(false);
          }
        }
      }
    });
  }

  @override
  Widget build(context) {
    return Scaffold(
      body: Column(
        children: [
          //Header container
          SizedBox(
            height: 90,
            width: double.infinity,
            child: ScrollablePositionedList.builder(
              itemScrollController: groupTabController,
              scrollDirection: Axis.horizontal,
              itemCount: _meals.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: Padding(
                    padding: index == _meals.length - 1
                        ? const EdgeInsets.only(
                            left: 20, top: 20, right: 20, bottom: 20)
                        : const EdgeInsets.all(20),
                    // Group name container
                    child: Container(
                        decoration: BoxDecoration(
                            color: index == clickedGroupIndex
                                ? themeColor
                                : Colors.white,
                            border: Border.all(width: 1.0, color: themeColor),
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Group ${index + 1}",
                            style: TextStyle(
                                fontSize: 20,
                                color: index == clickedGroupIndex
                                    ? Colors.white
                                    : themeColor),
                          ),
                        ))),
                  ),
                  onTap: () => {
                    scrollToGroupTab(index),
                    setGroupIndex(index),
                    scrollToMealGroup(),
                    setIsClicked(true)
                  },
                );
              },
            ),
          ),

          //Main Container
          Expanded(
            flex: 5,
            child: ScrollablePositionedList.builder(
              itemCount: _meals.length,
              itemScrollController: mealGroupController,
              itemPositionsListener: mealGroupListener,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        // Group name container
                        child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1.0, color: themeColor),
                                borderRadius: BorderRadius.circular(8)),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text("Group ${index + 1}",
                                    style: const TextStyle(fontSize: 20)),
                              ),
                            )),
                      ),
                      Column(
                        children: [
                          for (var meal in _meals[index])
                            // Meals container
                            Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: meal == _meals[index][0]
                                      ? Border(
                                          top: BorderSide(
                                              width: 1.0, color: themeColor),
                                          left: BorderSide(
                                              width: 1.0, color: themeColor),
                                          right: BorderSide(
                                              width: 1.0, color: themeColor),
                                          bottom: BorderSide(
                                              width: 1.0, color: themeColor),
                                        )
                                      : Border(
                                          top: BorderSide(
                                              width: 0, color: themeColor),
                                          left: BorderSide(
                                              width: 1.0, color: themeColor),
                                          right: BorderSide(
                                              width: 1.0, color: themeColor),
                                          bottom: BorderSide(
                                              width: 1.0, color: themeColor),
                                        ),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(30),
                                    child: Text("$meal",
                                        style: const TextStyle(fontSize: 15)),
                                  ),
                                )),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

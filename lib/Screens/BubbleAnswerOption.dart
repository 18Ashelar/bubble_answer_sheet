import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_countdown_timer/countdown.dart';
import 'package:flutter_countdown_timer/countdown_controller.dart';
import 'package:sortedmap/sortedmap.dart';

import '../Components/AnswerValue.dart';
import '../Components/Round_icon_button.dart';
import '../Constants.dart';
import 'AnswerSheetTable.dart';

class BubbleQuestion extends StatefulWidget {
  BubbleQuestion({this.noOfQuestion, this.timeSecond});

  final int noOfQuestion;
  final String timeSecond;

  @override
  _BubbleQuestionState createState() => _BubbleQuestionState();
}

class _BubbleQuestionState extends State<BubbleQuestion> {
  final ScrollController _controllerOne = ScrollController();
  int endTime;
  bool isRunning = false;

  CountdownController countdownController;

  @override
  void initState() {
    countdownController = CountdownController(
        duration: Duration(seconds: int.parse(widget.timeSecond)),
        onEnd: () {
          timeUp();
        });
    super.initState();
  }

  Map<int, String> colorChange = new Map();
  Map<int, Answer> ans = new SortedMap(Ordering.byKey());

  String numberQue(int i) {
    int j = i + 1;
    if (j < 10) {
      return "0$j)";
    } else {
      return "$j)";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: DraggableScrollbar.rrect(
                heightScrollThumb: 80.0,
                backgroundColor: Colors.grey.shade800,
                labelTextBuilder: (offset) {
                  final int currentItem = _controllerOne.hasClients
                      ? (_controllerOne.offset /
                              _controllerOne.position.maxScrollExtent *
                              widget.noOfQuestion)
                          .floor()
                      : 0;
                  return Text(
                    "$currentItem",
                    style: kScrollBarCounter,
                  );
                },
                labelConstraints:
                    BoxConstraints.tightFor(width: 80.0, height: 40.0),
                controller: _controllerOne,
                child: ListView.builder(
                    controller: _controllerOne,
                    itemCount: widget.noOfQuestion,
                    itemExtent: 70,
                    padding: EdgeInsets.only(top: 10.0),
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            numberQue(index),
                            style: kTextNumStyle,
                          ),
                          RoundIconButton(
                              onPressed: () {
                                setState(
                                  () {
                                    ans[index + 1] = Answer("A");
                                    colorChange[index] = "A";
                                  },
                                );
                              },
                              selectedColor: colorChange[index] == "A"
                                  ? kSelectedColor
                                  : kDefaultButtonColor,
                              ans: "A"),
                          RoundIconButton(
                              onPressed: () {
                                setState(
                                  () {
                                    ans[index + 1] = Answer("B");
                                    colorChange[index] = "B";
                                  },
                                );
                              },
                              selectedColor: colorChange[index] == "B"
                                  ? kSelectedColor
                                  : kDefaultButtonColor,
                              ans: "B"),
                          RoundIconButton(
                              onPressed: () {
                                setState(
                                  () {
                                    ans[index + 1] = Answer("C");
                                    colorChange[index] = "C";
                                  },
                                );
                              },
                              selectedColor: colorChange[index] == "C"
                                  ? kSelectedColor
                                  : kDefaultButtonColor,
                              ans: "C"),
                          RoundIconButton(
                              onPressed: () {
                                setState(
                                  () {
                                    ans[index + 1] = Answer("D");
                                    colorChange[index] = "D";
                                  },
                                );
                              },
                              selectedColor: colorChange[index] == "D"
                                  ? kSelectedColor
                                  : kDefaultButtonColor,
                              ans: "D"),
                        ],
                      );
                    }),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 60.0,
                    padding: EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
                    child: TextButton(
                      onPressed: () {
                        countdownController.dispose();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AnswerSheetResult(
                              myObject: ans,
                              noOfQuestion: widget.noOfQuestion,
                            ),
                          ),
                        );
                      },
                      child: Text("SUBMIT"),
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(
                            fontSize: 20, fontStyle: FontStyle.normal),
                        primary: Colors.white,
                        backgroundColor: Colors.green,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 60.0,
                    padding: EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          isRunning = false;
                          colorChange.clear();
                          ans.clear();
                        });
                      },
                      child: Text("RESET"),
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(
                            fontSize: 20, fontStyle: FontStyle.normal),
                        primary: Colors.white,
                        backgroundColor: Colors.grey,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isRunning ? Icons.stop : Icons.play_arrow),
        backgroundColor: Colors.blue,
        onPressed: () {
          if (!countdownController.isRunning) {
            countdownController.start();
            setState(() {
              isRunning = true;
            });
          } else {
            countdownController.stop();
            setState(() {
              isRunning = false;
            });
          }
        },
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      // title: Text("Bubble Answer Sheet"),
      actions: [
        Center(
          child: Container(
            padding: EdgeInsets.all(10),
            //   color: Colors.red,
            margin: EdgeInsets.only(right: 15),
            child: Countdown(
                countdownController: countdownController,
                builder: (_, Duration time) {
                  return Text(
                    '${time.inHours}:${time.inMinutes % 60}:${time.inSeconds % 60}',
                    style: TextStyle(fontSize: 25, color: Colors.red),
                  );
                }),
          ),
        ),
      ],
    );
  }

  Future timeUp() {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: Color(0xFF515C6E),
        elevation: 25,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        titlePadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        title: Container(
            height: 150,
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              // color: Color(0xFF515C6E),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
              child: Hero(
                tag: "preview",
                child: Icon(
                  Icons.timer_off,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            )),
        contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        content: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Time's Up!!!",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Your time has been expired!",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                    width: 100,
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.green),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AnswerSheetResult(
                              myObject: ans,
                              noOfQuestion: widget.noOfQuestion,
                            ),
                          ),
                        );
                      },
                      child: Text("SUBMIT"),
                    ))
              ],
            )),
      ),
    );
  }
}

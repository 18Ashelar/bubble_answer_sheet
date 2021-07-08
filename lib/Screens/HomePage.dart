import 'package:bubble_answer_sheet/Components/GesturesDetector.dart';
import 'package:flutter/material.dart';

import '../Constants.dart';
import 'BubbleAnswerOption.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int noOfQuestion;
  String second;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Bubble Answer Sheet"),
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          noOfQuestion = 25;
                        });
                        inputAlertDialog();
                        // setState(() {
                        //   noOfQuestion = 25;
                        // });
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => MyHomePage(),
                        //   ),
                        // );
                      },
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            child: Image.asset(
                              "assets/final.png",
                              color: Colors.white,
                            ),
                            height: 80.0,
                            width: 80.0,
                          ),
                          Text(
                            "No of Question",
                            style: kLabelTextStyle,
                          ),
                          Text(
                            "25",
                            style: kNumberTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          noOfQuestion = 50;
                        });
                        inputAlertDialog();
                      },
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            child: Image.asset(
                              "assets/final.png",
                              color: Colors.tealAccent,
                            ),
                            height: 80.0,
                            width: 80.0,
                          ),
                          Text(
                            "No of Question",
                            style: kLabelTextStyle,
                          ),
                          Text(
                            "50",
                            style: kNumberTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          noOfQuestion = 100;
                        });
                        inputAlertDialog();
                      },
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            child: Image.asset(
                              "assets/final.png",
                              color: Colors.orangeAccent,
                            ),
                            height: 80.0,
                            width: 80.0,
                          ),
                          Text(
                            "No of Question",
                            style: kLabelTextStyle,
                          ),
                          Text(
                            "100",
                            style: kNumberTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          noOfQuestion = 150;
                        });
                        inputAlertDialog();
                      },
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            child: Image.asset(
                              "assets/final.png",
                              color: Colors.limeAccent,
                            ),
                            height: 80.0,
                            width: 80.0,
                          ),
                          Text(
                            "No of Question",
                            style: kLabelTextStyle,
                          ),
                          Text(
                            "150",
                            style: kNumberTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          noOfQuestion = 200;
                        });
                        inputAlertDialog();
                      },
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            child: Image.asset(
                              "assets/final.png",
                              color: Colors.lightGreenAccent,
                            ),
                            height: 80.0,
                            width: 80.0,
                          ),
                          Text(
                            "No of Question",
                            style: kLabelTextStyle,
                          ),
                          Text(
                            "200",
                            style: kNumberTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          noOfQuestion = 250;
                        });
                        inputAlertDialog();
                      },
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            child: Image.asset(
                              "assets/final.png",
                              color: Colors.lightBlueAccent,
                            ),
                            height: 80.0,
                            width: 80.0,
                          ),
                          Text(
                            "No of Question",
                            style: kLabelTextStyle,
                          ),
                          Text(
                            "250",
                            style: kNumberTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
            ],
          ),
        ));
  }

  Future inputAlertDialog() {
    return showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              padding:
                  EdgeInsets.only(top: 20, bottom: 20, right: 50, left: 50),
              height: MediaQuery.of(context).size.height * 0.5,
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          setState(() {
                            second = value;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter time limit in second.',
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                        width: 100,
                        height: 50,
                        child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: Colors.green),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BubbleQuestion(
                                  noOfQuestion: noOfQuestion,
                                  timeSecond: second,
                                ),
                              ),
                            );
                          },
                          child: Text("SUBMIT"),
                        ))
                  ],
                ),
              ),
            ),
          );
        });
  }
}

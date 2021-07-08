import 'package:bubble_answer_sheet/Constants.dart';
import 'package:flutter/material.dart';

import '../Components/BottomBtn.dart';
import 'Review_Score.dart';

class AnswerSheetResult extends StatefulWidget {
  AnswerSheetResult({this.myObject, this.noOfQuestion});
  final Map myObject;
  int noOfQuestion;
  @override
  _AnswerSheetResultState createState() => _AnswerSheetResultState();
}

class _AnswerSheetResultState extends State<AnswerSheetResult> {
  Map<int, String> colorChange = new Map();
  Map<int, bool> ans = new Map();
  int correctAns = 0;
  int wrongAns = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Bubble Answer Sheet"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: DataTable(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  columns: const <DataColumn>[
                    DataColumn(
                      label: Text('Field'),
                    ),
                    DataColumn(label: Text('Data')),
                    DataColumn(label: Text('Right')),
                    DataColumn(label: Text('Wrong')),
                  ],
                  rows: widget.myObject.entries
                      .map((e) => DataRow(cells: [
                            DataCell(
                              Text(
                                e.key.toString(),
                                style: kTextNumStyle,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            DataCell(Text(
                              e.value.ans,
                              style: kTextNumStyle,
                            )),
                            DataCell(RawMaterialButton(
                              child: Icon(
                                Icons.check_sharp,
                                size: 20.0,
                                color: colorChange[e.key] == "A"
                                    ? kIconRightWrong
                                    : kIconDefault,
                              ),
                              fillColor: colorChange[e.key] == "A"
                                  ? kRightAnsColor
                                  : kDefaultButtonColor,
                              elevation: 0.0,
                              onPressed: () {
                                setState(
                                  () {
                                    colorChange[e.key] = "A";
                                    ans[e.key] = true;
                                  },
                                );
                              },
                              constraints: BoxConstraints.tightFor(
                                width: 30.0,
                                height: 30.0,
                              ),
                              shape: CircleBorder(),
                            )),
                            DataCell(RawMaterialButton(
                              child: Icon(
                                Icons.clear_rounded,
                                size: 20.0,
                                color: colorChange[e.key] == "B"
                                    ? kIconRightWrong
                                    : kIconDefault,
                              ),
                              fillColor: colorChange[e.key] == "B"
                                  ? kWrongAnswer
                                  : kDefaultButtonColor,
                              elevation: 0.0,
                              onPressed: () {
                                setState(
                                  () {
                                    colorChange[e.key] = "B";
                                    ans[e.key] = false;
                                  },
                                );
                              },
                              constraints: BoxConstraints.tightFor(
                                width: 30.0,
                                height: 30.0,
                              ),
                              shape: CircleBorder(),
                            )),
                          ]))
                      .toList(),
                ),
              ),
              Container(
                child: BottomButton(
                    buttonTitle: 'REVIEW',
                    onTap: () {
                      //CalculatorBrain calc =
                      // CalculatorBrain(height: height, weight: weight);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReviewScore(
                            ans: ans,
                            noOfQuestion: widget.noOfQuestion,
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ));
  }
}

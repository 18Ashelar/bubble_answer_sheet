import 'package:bubble_answer_sheet/Constants.dart';
import 'package:flutter/material.dart';

class ReviewScore extends StatefulWidget {
  ReviewScore({
    this.ans,
    this.noOfQuestion,
  });

  final Map<int, bool> ans;
  final int noOfQuestion;

  @override
  _ReviewScoreState createState() => _ReviewScoreState();
}

class _ReviewScoreState extends State<ReviewScore> {
  int correctAns = 0;
  int wrongAns = 0;

  @override
  void initState() {
    widget.ans.forEach((key, value) {
      if (value == true) {
        correctAns++;
      } else {
        wrongAns++;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bubble Answer Sheet"),
      ),
      body: Column(
        children: [
          Container(
            child: Card(
              child: ListTile(
                leading:
                    Icon(Icons.check_circle, size: 40.0, color: Colors.green),
                title: Text(
                  "CORRECT: " + correctAns.toString(),
                  style: kCorrectQuestion,
                ),
              ),
            ),
          ),
          Container(
            child: Card(
              child: ListTile(
                leading: Icon(Icons.cancel, size: 40.0, color: Colors.red),
                title: Text(
                  "WRONG: " + wrongAns.toString(),
                  style: kCorrectQuestion,
                ),
              ),
            ),
          ),
          Container(
            child: Card(
              child: ListTile(
                leading:
                    Icon(Icons.help_rounded, size: 40.0, color: Colors.white54),
                title: Text(
                  "NOT ATTEMPT: " +
                      (widget.noOfQuestion - (correctAns + wrongAns))
                          .toString(),
                  style: kCorrectQuestion,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

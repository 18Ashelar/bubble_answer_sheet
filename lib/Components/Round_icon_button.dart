import 'package:bubble_answer_sheet/AnswerSheet.dart';
import 'package:flutter/material.dart';

import '../Constants.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.onPressed, this.selectedColor, this.ans});

  final Function onPressed;
  final Color selectedColor;
  final String ans;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Text(
        ans,
        style: kButtonTextStyle,
      ),
      fillColor: selectedColor,
      elevation: 0.0,
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: 40.0,
        height: 40.0,
      ),
      shape: CircleBorder(),
    );
  }
}

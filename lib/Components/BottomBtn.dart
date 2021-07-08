import 'package:flutter/material.dart';

import '../Constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap, @required this.buttonTitle});

  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: kLargeButtonTextStyle,
          ),
        ),
        color: Colors.green,
        margin: EdgeInsets.only(top: 20.0),
        padding: EdgeInsets.all(10.0),
        width: double.infinity,
        height: 60.0,
      ),
    );
  }
}

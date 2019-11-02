import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.title, @required this.onTap});

  final Function onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          title,
          style: kMediumTextStyle,
        ),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(bottom: 20),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}

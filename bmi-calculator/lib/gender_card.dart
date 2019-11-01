import 'package:flutter/material.dart';

const iconSize = 80.0;
const gap = 15.0;
const genderTextColor = 0xFF8D8E98;

class GenderCard extends StatelessWidget {
  final IconData icon;
  final String title;

  GenderCard({this.icon, this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: iconSize,
        ),
        SizedBox(
          height: gap,
        ),
        Text(
          title,
          style: TextStyle(color: Color(genderTextColor), fontSize: 18.0),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import 'constants.dart';

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
          size: kIconSize,
        ),
        SizedBox(
          height: kGap,
        ),
        Text(
          title,
          style: kSmallTextStyle,
        ),
      ],
    );
  }
}

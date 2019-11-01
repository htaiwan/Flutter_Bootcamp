import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  // 為什麼這裡是用final
  // https://dart.dev/guides/language/language-tour#final-and-const
  final Color color;
  final Widget cardChild;

  ReusableCard({@required this.color, this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}

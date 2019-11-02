import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

import '../components/bottom_button.dart';
import '../components/reusable_card.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('BMI 計算結果'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your Result',
                  style: kTitleTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                color: kInActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      '超級肥胖',
                      style: kResultTextStyle,
                    ),
                    Text(
                      '78',
                      style: kBMITextStyle,
                    ),
                    Text(
                      '超級肥胖超級肥胖超級肥胖超級肥胖超級肥胖超級肥胖超級肥胖超級肥胖超級肥胖',
                      style: kBMIBodyStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: BottomButton(
                  title: '再計算一次',
                  onTap: () {
                    Navigator.pop(context);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

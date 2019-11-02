import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;

  double _bmi;

  CalculatorBrain({this.height, this.weight});

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);

    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return "超級胖";
    } else if (_bmi >= 18.5) {
      return "剛剛好";
    } else {
      return "超級瘦";
    }
  }

  String getAnalysis() {
    if (_bmi >= 25) {
      return "需要運動,需要運動,需要運動,需要運動,需要運動,需要運動,需要運動,需要運動,需要運動,需要運動,需要運動,需要運動,";
    } else if (_bmi >= 18.5) {
      return "不用運動,不用運動,不用運動,不用運動,不用運動,不用運動,不用運動,不用運動,不用運動,不用運動,不用運動,不用運動,";
    } else {
      return "多吃一點,多吃一點,多吃一點,多吃一點,多吃一點,多吃一點,多吃一點,多吃一點,多吃一點,多吃一點,多吃一點,多吃一點,";
    }
  }
}

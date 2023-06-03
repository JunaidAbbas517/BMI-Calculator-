import 'dart:math';

class Funtionality {
  Funtionality({required this.height, required this.weigth});
  final int weigth;

  final int height;
  double bmi = 0;

  String getBmi() {
    bmi = weigth / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (bmi >= 25) {
      return 'OverWeight';
    } else if (bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterperation() {
    if (bmi >= 25) {
      return 'You have a higher then normal body weight. ';
    } else if (bmi > 18.5) {
      return 'You have a normal body weight.';
    } else {
      return 'You have a lower then normal body weight.';
    }
  }
}

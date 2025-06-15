import 'dart:math';

class BmiBrain {
  BmiBrain({this.height, this.weight});

  final int? height;
  final int? weight;

  late double _bmi;
  String calculateBmi() {
    _bmi = weight! / pow(height! / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight! 🤐';
    } else if (_bmi >= 18.5 && _bmi < 25) {
      return 'Normal 😊';
    } else {
      return 'Underweight! 😓';
    }
  }

  String getSummary() {
    if (_bmi >= 25) {
      return 'You\'re overweight. You should do exercise more and eat healthy.';
    } else if (_bmi >= 18.5 && _bmi < 25) {
      return 'Good Job! Try to maintain this scale 😊';
    } else {
      return 'You\'re Underweight! You should eat more nutritious  food enriched with carbs and proteins.';
    }
  }
}

import 'dart:math';

class BmiBrain {
  BmiBrain({required this.height, required this.weight});

  final double height;
  final int weight;

  double _bmi = 0;
  String calculateBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 30) {
      return 'Obese! 😵';
    } else if (_bmi >= 25) {
      return 'Overweight 🤐';
    } else if (_bmi >= 18.5) {
      return 'Normal. 😊';
    } else {
      return 'Underweight! 😓';
    }
  }

  String getSummary() {
    if (_bmi >= 30) {
      return 'YOU\'RE CLOSER TO DEATH! TONE DOWN NOW!!';
    } else if (_bmi >= 25) {
      return 'You\'re Overweight. You should exercise more and eat healthy.';
    } else if (_bmi >= 18.5) {
      return 'Good Job! Try to maintain this range.';
    } else {
      return 'You\'re underweight. Eat more nutritious and protein riched food';
    }
  }
}

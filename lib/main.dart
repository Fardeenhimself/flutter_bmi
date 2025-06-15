import 'package:flutter/material.dart';
import 'pages/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: ThemeData(
        fontFamily: 'GSans',
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF93E9BE)),
        appBarTheme: AppBarTheme(
          elevation: 4.0,
          shadowColor: Theme.of(context).colorScheme.shadow,
          centerTitle: true,
        ),
      ),
      darkTheme: ThemeData(
        fontFamily: 'GSans',
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF2D2D2D),
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: Color(0xFF121212),
        appBarTheme: AppBarTheme(elevation: 4.0, centerTitle: true),
      ),
      home: InputPage(),
    );
  }
}

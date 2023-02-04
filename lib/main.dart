import 'package:bmicalc/screens/InputPage.dart';
import 'package:bmicalc/screens/ResultsPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BMICalcApp());
}

class BMICalcApp extends StatelessWidget {
  const BMICalcApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF0A0E21),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
        //colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.purple),
        textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.white)),
      ),
      initialRoute: '/',
      routes: {
        '/':(context) => InputPage(),
      },
    );
  }
}

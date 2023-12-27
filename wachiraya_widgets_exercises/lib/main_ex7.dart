import 'package:flutter/material.dart';
import './app_screens/submit_button.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Widget From Exercise',
      debugShowCheckedModeBanner: false, // Remove the debug banner
      home: WidgetsExercise7(),
    );
  }
}
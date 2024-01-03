import 'package:flutter/material.dart';
import './app_screens/custom_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Custom Fonts Exercise',
      debugShowCheckedModeBanner: false,
      home: MyName(),
    );
  }
}
import 'package:flutter/material.dart';
import './app_screens/faculty_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'KKU faculty Demo',
      home: FacultyList(),
      debugShowCheckedModeBanner: false,
    );
  }
}

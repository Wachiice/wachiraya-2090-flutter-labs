import 'package:flutter/material.dart';
import './app_screens/listview_exercise.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BasicListView',
      debugShowCheckedModeBanner: false, // Remove the debug banner
     
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[50],
          elevation: 0.0,
          title: const Text('BasicListView'),
          centerTitle: true,
          titleTextStyle: const TextStyle(color: Colors.black, fontSize: 20,)
        ),
        body: ListView(
          children: const [
            ListTileFaculty(
              facFullName: 'Engineering',
              facShortName: 'EN',
              facIcon: Icon(Icons.engineering),
              trailingIcon: Icon(Icons.star),
            ),
            ListTileFaculty(
              facFullName: 'Agriculture',
              facShortName: 'AG',
              facIcon: Icon(Icons.agriculture),
            ),
            ListTileFaculty(
              facFullName: 'Architecture',
              facShortName: 'AR',
              facIcon: Icon(Icons.architecture),
            ),
          ],
        ),
      ),
    );
  }
}

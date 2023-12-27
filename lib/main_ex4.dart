import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove the debug banner
      home: Scaffold(
        appBar: AppBar(
          title: const Text('StatefulWidget: Counter'),
          centerTitle: true,
        ),
        body: const Center(
          child: MyWidget(),
        ),
      ),
    );
  }
}
class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  _MyWidgetState createState() => _MyWidgetState();
}
class _MyWidgetState extends State<MyWidget> {
  int _randomNumber1 = Random().nextInt(10) + 1;
  int _randomNumber2 = Random().nextInt(10) + 1;

  void _generateRandomNumbers() {
    setState(() {
      _randomNumber1 = Random().nextInt(10) + 1;
      _randomNumber2 = Random().nextInt(10) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _generateRandomNumbers,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Manee',
            style: TextStyle(fontSize: 30.0),
          ),
          Text(
             '$_randomNumber1 + $_randomNumber2 = ${_randomNumber1 + _randomNumber2}',
            style: const TextStyle(
              fontSize: 30.0,
              backgroundColor: Colors.lightGreen,
              fontWeight: FontWeight.bold ,
              ),
          ),
        ],
      ),
    );
  }
}

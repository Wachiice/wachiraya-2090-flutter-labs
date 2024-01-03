import 'package:flutter/material.dart';
import './app_screens/gesture_detector_stateful.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter layout tutorial',
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Gesture Detector tutorial'),
              backgroundColor: Colors.grey[50],
              elevation: 0.0,
              centerTitle: true,
              titleTextStyle: const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            body: const Center(child: MyGestureDetector())));
  }
}

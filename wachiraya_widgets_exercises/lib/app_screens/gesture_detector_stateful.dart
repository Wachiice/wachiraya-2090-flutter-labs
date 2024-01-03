import 'package:flutter/material.dart';

class MyGestureDetector extends StatefulWidget {
  const MyGestureDetector({Key? key}) : super(key: key);

  @override
  _MyGestureDetectorState createState() => _MyGestureDetectorState();
}

class _MyGestureDetectorState extends State<MyGestureDetector> {
  String _gesture = '';

  void _updateGesture(String gesture) {
    setState(() {
      _gesture = gesture;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => _updateGesture('Tap'),
          onDoubleTap: () => _updateGesture('Double Tap'),
          onLongPress: () => _updateGesture('Long Press'),
          child: Container(
            color: Colors.blue,
            height: 200,
            width: 200,
            child: Center(
              child: Text(
                _gesture,
                style: const TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Gesture performed: $_gesture',
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class MyGestureDetector extends StatefulWidget {
  const MyGestureDetector({Key? key}) : super(key: key);

  @override
  _MyGestureDetectorState createState() => _MyGestureDetectorState();
}

class _MyGestureDetectorState extends State<MyGestureDetector> {
  String _gesture = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _gesture = 'Tap';
            });
          },
          onDoubleTap: () {
            setState(() {
              _gesture = 'Double Tap';
            });
          },
          onLongPress: () {
            setState(() {
              _gesture = 'Long Press';
            });
          },
          child: Container(
            width: 200,
            height: 200,
            color: Colors.blue,
            child: Center(
              child: Text(
                _gesture,
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Gesture performed: $_gesture',
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class WidgetsExercise extends StatelessWidget {
  const WidgetsExercise({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[300],
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  "Wachiraya",
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontFamily: 'Prompt-Regular',
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Expanded(
                child: Text(
                  "643040209-0",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontFamily: 'Prompt-Regular',
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 30),
            child: Image(
              image: AssetImage('images/me.jpg'),
            ),
          ),
          Text(
            "Photo Credit: Swiatchaya",
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.center,
            style: TextStyle(
                decoration: TextDecoration.none,
                fontFamily: 'Prompt-Regular',
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

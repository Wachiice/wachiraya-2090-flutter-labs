import 'package:flutter/material.dart';

void main() {
  runApp(const BasicAndText());
}

class BasicAndText extends StatelessWidget {
  const BasicAndText({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("Hello");
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: const Text("Thai Universities"),
          ),
          body: const Row(children: <Widget>[
            Text(
              "มหาวิทยาลัยขอนแก่น",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Sarabun',
                  color: Colors.green,
                  fontSize: 30),
            ),
            Text(
              "มหาวิทยาลัยเชียงใหม่",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Sarabun',
                  color: Colors.blue,
                  fontSize: 30),
            )
          ]),
        ));
  }
}

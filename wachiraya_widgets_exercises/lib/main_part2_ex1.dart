import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            title: const Text('Quiz App by 643040209-0'),
            backgroundColor: Colors.grey[50],
            elevation: 0.0,
            titleTextStyle: const TextStyle(
              color: Colors.black,
              fontSize: 20,
            )),
        body: Column(
          children: [
            QuestionWidget(
              question: 'Where is this picture?',
              image: Image.asset('images/kku.jpg'),
              choices: const [
                ChoiceWidget(
                    text: 'Chiang Mai University',
                    backgroundColor: Colors.purpleAccent,
                    foregroundColor: Colors.white),
                ChoiceWidget(
                    text: 'Khon Kaen University',
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.black),
                ChoiceWidget(
                    text: 'Chulalongkorn University',
                    backgroundColor: Colors.pink,
                    foregroundColor: Colors.white),
                ChoiceWidget(
                    text: 'Mahidol University',
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class QuestionWidget extends StatelessWidget {
  final String question;
  final Image image;
  final List<ChoiceWidget> choices;

  const QuestionWidget(
      {Key? key,
      required this.question,
      required this.image,
      required this.choices})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40, left: 40, right: 40),
          child: Text(question,
              style: const TextStyle(fontSize: 25, color: Colors.pinkAccent)),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 50, left: 50, right: 50, bottom: 100),
          child: image,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [(choices[0]), (choices[1])],
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [(choices[2]), (choices[3])],
        )
      ],
    );
  }
}

class ChoiceWidget extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color foregroundColor;
  const ChoiceWidget(
      {Key? key,
      required this.text,
      required this.backgroundColor,
      required this.foregroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      width: 160,
      height: 60,
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: foregroundColor),
        ),
      ),
    );
  }
}

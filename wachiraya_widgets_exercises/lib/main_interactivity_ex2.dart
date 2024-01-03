import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    debugPrint(screenW.toString());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: screenW <= 600
            ? AppBar(
                title: const Text('Quiz App by 643040209-0'),
                backgroundColor: Colors.grey[50],
                elevation: 0.0,
                titleTextStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ))
            : null,
        body: Column(
          children: [
            QuestionWidget(
              question: 'Where is this picture?',
              image: Image.asset('images/kku.jpg'),
              choices: const [
                ChoiceWidget(
                  text: 'Khon Kaen University',
                  backgroundColor: Colors.orange,
                  correct: true,
                ),
                ChoiceWidget(
                  text: 'Chiang Mai University',
                  backgroundColor: Colors.purpleAccent,
                  correct: false,
                ),
                ChoiceWidget(
                  text: 'Chulalongkorn University',
                  backgroundColor: Colors.pink,
                  correct: false,
                ),
                ChoiceWidget(
                  text: 'Mahidol University',
                  backgroundColor: Colors.blue,
                  correct: false,
                ),
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
    final screenW = MediaQuery.of(context).size.width;
    debugPrint(screenW.toString());
    return Column(
      children: [
        Padding(
          padding: screenW <= 600
              ? const EdgeInsets.all(40)
              : const EdgeInsets.only(top: 40),
          child: Text(question,
              style: const TextStyle(fontSize: 25, color: Colors.pinkAccent)),
        ),
        Padding(
          padding: screenW <= 600
              ? const EdgeInsets.only(top: 50, left: 50, right: 50, bottom: 100)
              : const EdgeInsets.only(left: 50, right: 50, bottom: 10),
          child: screenW <= 600
              ? SizedBox(child: image)
              : SizedBox(
                  width: 250,
                  child: image,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [(choices[0]), (choices[1])],
        ),
        screenW <= 600
            ? const SizedBox(
                height: 40,
              )
            : const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [(choices[2]), (choices[3])],
        )
      ],
    );
  }
}

class ChoiceWidget extends StatefulWidget {
  final String text;
  final bool correct;
  final Color backgroundColor;

  const ChoiceWidget({
    Key? key,
    required this.text,
    required this.correct,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  _ChoiceWidgetState createState() => _ChoiceWidgetState();
}

class _ChoiceWidgetState extends State<ChoiceWidget> {
  bool active = false;

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    debugPrint(screenW.toString());
    return GestureDetector(
      onTap: () {
        setState(() {
          active = true;
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(widget.correct ? 
            'Your Score is 1':'Your Score is 0'
              ),
               action: SnackBarAction(
                    label: '',
                    onPressed: () {},
                  ),
              ));
      },
      child: Container(
        color: active
            ? (widget.correct ? Colors.green : Colors.red)
            : widget.backgroundColor,
        width: screenW <= 600 ? 160 : 350,
        height: 60,
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Text(
            widget.text,
          ),
        ),
      ),
    );
  }
}

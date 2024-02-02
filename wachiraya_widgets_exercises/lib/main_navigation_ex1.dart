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
                backgroundColor: Colors.grey[50],
                title: const Text('Quiz App by 643040209-0'),
                centerTitle: true,
                elevation: 0.0,
                titleTextStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ))
            : null,
        body: const SafeArea(
          child: QuestionNavigator(),
        ),
      ),
    );
  }
}

class QuestionNavigator extends StatefulWidget {
  const QuestionNavigator({Key? key}) : super(key: key);

  @override
  State<QuestionNavigator> createState() => _QuestionNavigatorState();
}

class _QuestionNavigatorState extends State<QuestionNavigator> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            controller: _controller,
            onPageChanged: (page) => setState(() => _currentPage = page),
            children: [
              QuestionWidget(
                orderQuestions: 'Quiz 1',
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
              QuestionWidget(
                orderQuestions: 'Quiz 2',
                question: 'Where is this picture?',
                image: Image.asset('images/kku.jpg'),
                choices: const [
                  ChoiceWidget(
                    text: 'CMU',
                    backgroundColor: Colors.orange,
                    correct: false,
                  ),
                  ChoiceWidget(
                    text: 'KKU',
                    backgroundColor: Colors.purpleAccent,
                    correct: true,
                  ),
                  ChoiceWidget(
                    text: 'CU',
                    backgroundColor: Colors.pink,
                    correct: false,
                  ),
                  ChoiceWidget(
                    text: 'MU',
                    backgroundColor: Colors.blue,
                    correct: false,
                  ),
                ],
              ),
              QuestionWidget(
                orderQuestions: 'Quiz 3',
                question: 'Where is this picture?',
                image: Image.asset('images/kku.jpg'),
                choices: const [
                  ChoiceWidget(
                    text: 'CMU',
                    backgroundColor: Colors.orange,
                    correct: false,
                  ),
                  ChoiceWidget(
                    text: 'CU',
                    backgroundColor: Colors.purpleAccent,
                    correct: false,
                  ),
                  ChoiceWidget(
                    text: 'KKU',
                    backgroundColor: Colors.pink,
                    correct: true,
                  ),
                  ChoiceWidget(
                    text: 'MU',
                    backgroundColor: Colors.blue,
                    correct: false,
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (_currentPage > 0)
                ElevatedButton(
                  onPressed: () => _controller.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text('Previous'),
                ),
              if (_currentPage < 2)
                ElevatedButton(
                  onPressed: () => _controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text('Next'),
                ),
            ],
          ),
        )
      ],
    );
  }
}

class QuestionWidget extends StatelessWidget {
  final String orderQuestions;
  final String question;
  final Image image;
  final List<ChoiceWidget> choices;

  const QuestionWidget({
    Key? key,
    required this.orderQuestions,
    required this.question,
    required this.image,
    required this.choices,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    debugPrint(screenW.toString());
    return Column(
      children: [
        Padding(
            padding: screenW <= 600
                ? const EdgeInsets.only(top: 20, bottom: 10)
                : const EdgeInsets.only(top: 20),
            child: screenW <= 600
                ? Text(orderQuestions,
                    style: const TextStyle(fontSize: 28, color: Colors.blue))
                : Text(orderQuestions,
                    style: const TextStyle(fontSize: 24, color: Colors.blue))),
        Padding(
            padding: screenW <= 600
                ? const EdgeInsets.only(top: 10, bottom: 10)
                : const EdgeInsets.only(top: 10, bottom: 10),
            child: screenW <= 600
                ? Text(question,
                    style:
                        const TextStyle(fontSize: 25, color: Colors.pinkAccent))
                : Text(question,
                    style: const TextStyle(
                        fontSize: 20, color: Colors.pinkAccent))),
        Padding(
          padding: screenW <= 600
              ? const EdgeInsets.only(top: 50, left: 50, right: 50, bottom: 50)
              : const EdgeInsets.only(left: 50, right: 50, bottom: 10),
          child: screenW <= 600
              ? SizedBox(child: image)
              : SizedBox(
                  width: 180,
                  child: image,
                ),
        ),
        Padding(
            padding: screenW <= 600
                ? const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  )
                : const EdgeInsets.only(
                    left: 50,
                    right: 50,
                  ),
            child: Expanded(
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: screenW <= 600 ? 20 : 14,
                childAspectRatio: screenW <= 600 ? 2 : 9,
                children: choices,
              ),
            ))
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

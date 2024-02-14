import 'package:flutter/material.dart';
import 'package:wachiraya_2090_flutter_exercise/main_navigation_ex3.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (page) => setState(() => _currentPage = page),
                children: [
                  QuestionWidget(
                    orderQuestionsAppbar: 'Quiz 1 App by 643040209-0',
                    orderQuestions: 'Questions 1',
                    question: 'Where is this picture?',
                    image: Image.asset('images/kku.jpg'),
                    choices: [
                      ChoiceWidget(
                        text: 'Khon Kaen University',
                        backgroundColor: Colors.orange,
                        correct: true,
                        controller: _controller,
                      ),
                      ChoiceWidget(
                        text: 'Chiang Mai University',
                        backgroundColor: Colors.purpleAccent,
                        correct: false,
                        controller: _controller,
                      ),
                      ChoiceWidget(
                        text: 'Chulalongkorn University',
                        backgroundColor: Colors.pink,
                        correct: false,
                        controller: _controller,
                      ),
                      ChoiceWidget(
                        text: 'Mahidol University',
                        backgroundColor: Colors.blue,
                        correct: false,
                        controller: _controller,
                      ),
                    ],
                  ),
                  QuestionWidget(
                    orderQuestionsAppbar: 'Quiz 2 App by 643040209-0',
                    orderQuestions: 'Questions 2',
                    question: 'Where is this picture?',
                    image: Image.asset('images/kku.jpg'),
                    choices: [
                      ChoiceWidget(
                        text: 'CMU',
                        backgroundColor: Colors.orange,
                        correct: false,
                        controller: _controller,
                      ),
                      ChoiceWidget(
                        text: 'KKU',
                        backgroundColor: Colors.purpleAccent,
                        correct: true,
                        controller: _controller,
                      ),
                      ChoiceWidget(
                        text: 'CU',
                        backgroundColor: Colors.pink,
                        correct: false,
                        controller: _controller,
                      ),
                      ChoiceWidget(
                        text: 'MU',
                        backgroundColor: Colors.blue,
                        correct: false,
                        controller: _controller,
                      ),
                    ],
                  ),
                  QuestionWidget(
                    orderQuestionsAppbar: 'Quiz 3 App by 643040209-0',
                    orderQuestions: 'Questions 3',
                    question: 'Where is this picture?',
                    image: Image.asset('images/kku.jpg'),
                    choices: [
                      ChoiceWidget(
                        text: 'CMU',
                        backgroundColor: Colors.orange,
                        correct: false,
                        controller: _controller,
                      ),
                      ChoiceWidget(
                        text: 'CU',
                        backgroundColor: Colors.purpleAccent,
                        correct: false,
                        controller: _controller,
                      ),
                      ChoiceWidget(
                        text: 'KKU',
                        backgroundColor: Colors.pink,
                        correct: true,
                        controller: _controller,
                      ),
                      ChoiceWidget(
                        text: 'MU',
                        backgroundColor: Colors.blue,
                        correct: false,
                        controller: _controller,
                      ),
                    ],
                  ),
                  restartHome(
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Visibility(
                        maintainSize: true,
                        maintainAnimation: true,
                        maintainState: true,
                        visible:
                            _currentPage < 3 && _currentPage > 0 ? true : false,
                        child: ElevatedButton(
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
                      ),
                      Visibility(
                        maintainSize: true,
                        maintainAnimation: true,
                        maintainState: true,
                        visible: _currentPage < 3 ? true : false,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const homePage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text('Home'),
                        ),
                      ),
                      Visibility(
                        maintainSize: true,
                        maintainAnimation: true,
                        maintainState: true,
                        visible: _currentPage < 3 ? true : false,
                        child: ElevatedButton(
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
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ChoiceWidget extends StatefulWidget {
  final String text;
  final bool correct;
  final Color backgroundColor;
  final PageController controller;

  ChoiceWidget({
    Key? key,
    required this.text,
    required this.correct,
    required this.backgroundColor,
    required this.controller,
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
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Score!'),
              content: Text(widget.correct
                  ? 'Congrats, you get 1 point'
                  : 'Sorry, you miss it!'),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    widget.controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ],
            );
          },
        );
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

class QuestionWidget extends StatelessWidget {
  final String orderQuestionsAppbar;
  final String orderQuestions;
  final String question;
  final Image image;
  final List<ChoiceWidget> choices;

  const QuestionWidget({
    Key? key,
    required this.question,
    required this.image,
    required this.choices,
    required this.orderQuestions,
    required this.orderQuestionsAppbar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(orderQuestionsAppbar),
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: Colors.grey[50],
          titleTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 20,
          )),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text(orderQuestions,
                  style: const TextStyle(fontSize: 25, color: Colors.blue))),
          Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 10),
              child: Text(question,
                  style:
                      const TextStyle(fontSize: 25, color: Colors.pinkAccent))),
          Padding(
              padding: const EdgeInsets.only(
                  top: 50, left: 50, right: 50, bottom: 50),
              child: image),
          Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Expanded(
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 14,
                  childAspectRatio: 2,
                  children: choices,
                ),
              ))
        ],
      ),
    );
  }
}

class restartHome extends StatefulWidget {
  const restartHome({Key? key, required Null Function() onPressed})
      : super(key: key);

  @override
  State<restartHome> createState() => _restartHomeState();
}

class _restartHomeState extends State<restartHome> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const homePage(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: const Text('Restart'),
      ),
    );
  }
}

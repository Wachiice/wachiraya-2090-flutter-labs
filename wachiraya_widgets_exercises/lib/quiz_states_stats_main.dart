//This is quiz_states_stats_main.dart file//

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_screens/restart_page_lab12.dart';
import 'app_screens/question_page_view_lab12.dart';



void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ScoreNotifier(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: homePage());
  }
}

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/quiz.jpg',
                  width: 200,
                  height: 200,
                ),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Welcome to the Quiz App',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                const Text(
                  'By Wcahiraya Phonsa 643040209-0',
                  style: TextStyle(fontSize: 20, color: Colors.pinkAccent),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QuestionPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple[50],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Start',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

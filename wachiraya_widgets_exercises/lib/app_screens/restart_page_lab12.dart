//This is restart_page_lab12.dart file//
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wachiraya_2090_flutter_exercise/quiz_states_stats_main.dart';
import 'package:wachiraya_2090_flutter_exercise/app_screens/local_data_lab12.dart';
import '../quiz_ranking_main.dart';

void sendPostRequest(int totalScore, String name) async {
  final url = Uri.parse(
      'https://mobileappdev2024-9d00e-default-rtdb.asia-southeast1.firebasedatabase.app/scores_database.json');
  final response = await http.post(
    url,
    body: json.encode({
      'time': DateTime.now().toString(),
      'score': totalScore,
      'username': name,
    }),
  );
  debugPrint("response is ${response.statusCode}");
}

class ScoreNotifier extends ChangeNotifier {
  int _totalScore = 0;

  int get totalScore => _totalScore;

  void increment() {
    _totalScore++;
    notifyListeners();
  }

  void reset() {
    _totalScore = 0;
    notifyListeners();
  }
}

class restartPage extends StatefulWidget {
  const restartPage({Key? key, required Null Function() onPressed})
      : super(key: key);

  @override
  State<restartPage> createState() => _restartPageState();
}

class _restartPageState extends State<restartPage> {
  List<Score> score = [];
  String? username;
  DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    _loadScores();
  }

  Future<void> _loadScores() async {
    final loadedScores = await databaseHelper.getScores();
    setState(() {
      score = loadedScores;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ScoreNotifier>(
      builder: (context, scoreNotifier, child) {
        final currentScore = Score(
          score: scoreNotifier.totalScore,
        );

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // Scores Ranking displayed Lab13//
              Container(
                height: 250,
                child: const RankingView(),
              ),

              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'The Last Three Scores ',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange),
                ),
              ),

              // Here is where the three most recent scores will be displayed Lab13//
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "${score.map((e) => e.score).toList().reversed.join(", ")}",
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'Your total score is ${scoreNotifier.totalScore}',
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),

              ElevatedButton(
                onPressed: () async {
                  sendPostRequest(scoreNotifier.totalScore, "manee");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const homePage(),
                    ),
                  );
                  await databaseHelper.insertScore(currentScore);
                  await _loadScores();
                  scoreNotifier.reset();
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
                    'Restart',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.deepPurple,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

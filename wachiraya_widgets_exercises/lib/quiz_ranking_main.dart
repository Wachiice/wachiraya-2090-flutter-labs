//This is quiz_ranking_main.dart file//
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ScoreRanking {
  final int score;
  final String time;
  final String username;

  ScoreRanking(
    this.score,
    this.username,
    this.time,
  );

  @override
  String toString() => 'Score: $score, Username: $username, Time:$time';
}

//------------------------------------------------------------//
List<ScoreRanking> sortScores(List<ScoreRanking> records) {
  records.sort((a, b) => compareSocres(a, b));
  return records;
}

//------------------------------------------------------------//
int compareSocres(ScoreRanking a, ScoreRanking b) {
  int scoreComparison = b.score.compareTo(a.score);
  if (scoreComparison != 0) {
    return scoreComparison;
  }
  return a.username.compareTo(b.username);
}
//------------------------------------------------------------//

class Ranking extends StatefulWidget {
  const Ranking({super.key});

  @override
  _RankingState createState() => _RankingState();
}

class _RankingState extends State<Ranking> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: RankingView(),
      ),
    );
  }
}
//----------------------class RankingView-----------------------------------//

class RankingView extends StatefulWidget {
  const RankingView({super.key});

  @override
  _RankingViewState createState() => _RankingViewState();
}

class _RankingViewState extends State<RankingView> {
  final String _dataBaseUrl =
      'https://mobileappdev2024-9d00e-default-rtdb.asia-southeast1.firebasedatabase.app/scores_database.json';

  List<ScoreRanking> _records = [];

  Future<void> _fetchData() async {
    final response = await http.get(Uri.parse(_dataBaseUrl));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      debugPrint('Data is $data');
      _records = (data as Map<String, dynamic>)
          .entries
          .map((entry) => ScoreRanking(entry.value['score'],
              entry.value['username'], entry.value['time']))
          .toList();
      debugPrint("records are $_records");
      List<ScoreRanking> sortedRecords = sortScores(_records);
      _records = sortedRecords;
      debugPrint("records are $_records");
      setState(() {});
    } else {
      debugPrint('Error fetching data: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'Ranking Scores',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _records.length > 3 ? 3 : _records.length,
              itemBuilder: (context, index) {
                final record = _records[index];
                return ListTile(
                  title: Center(
                    child: Text(
                      '${record.username} ${record.score}',
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

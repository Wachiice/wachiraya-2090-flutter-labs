import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class ScoreRecord {
  final String score;
  final String timestamp;

  ScoreRecord(this.score, this.timestamp);

  @override
  String toString() => 'Score: $score, Timestamp: $timestamp';
}

//------------------------------------------------------------//
List<ScoreRecord> sortScores(List<ScoreRecord> records) {
  records.sort((a, b) => compareSocres(a, b));
  return records;
}

//------------------------------------------------------------//
int compareSocres(ScoreRecord a, ScoreRecord b) {
  int scoreComparison = a.score.compareTo(b.score);
  if (scoreComparison != 0) {
    return scoreComparison;
  }

  return b.timestamp.compareTo(a.timestamp);
}
//------------------------------------------------------------//

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController scoreController = TextEditingController();
  final String _dataBaseUrl =
    'https://mobile-53471-default-rtdb.asia-southeast1.firebasedatabase.app/score.json';

  List<ScoreRecord> _records = [];

  Future<void> _fetchData() async {
    final response = await http.get(Uri.parse(_dataBaseUrl));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      debugPrint('Data is $data');
      _records = (data as Map<String, dynamic>)
          .entries
          .map((entry) =>
              ScoreRecord(entry.value['score'], entry.value['timestamp']))
          .toList();
      debugPrint("records are $_records");
      List<ScoreRecord> sortedRecords = sortScores(_records);
      _records = sortedRecords;
      debugPrint("records are $_records");
      setState(() {});
    } else {
      debugPrint('Error fetching data: ${response.statusCode}');
    }
  }

  Future<void> _addRecord(String score) async {
    String timestamp = DateTime.now().toString();
    final body = jsonEncode({'score': score, 'timestamp': timestamp});
    final response = await http.post(
      Uri.parse(_dataBaseUrl),
      headers: {'Content-Type': 'application/json'},
      body: body,
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      _fetchData();
    } else {
      debugPrint('Error storing data: ${response.statusCode}');
    }
  }

  
  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Score Records')),
        body: Column(
          children: [
            TextField(
              controller: scoreController,
              decoration: const InputDecoration(labelText: 'Enter Score'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _records.length,
                itemBuilder: (context, index) {
                  final record = _records[index];
                  return ListTile(
                    title: Text( 'Score  ${record.score}'),
                    subtitle: Text('Timestamp : ${record.timestamp}'),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _addRecord(scoreController.text.toString());
              },
              child: const Text('Add Record'),
            ),
          ],
        ),
      ),
    );
  }
}

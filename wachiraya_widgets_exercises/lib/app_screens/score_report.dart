import 'package:flutter/material.dart';

class ScoreReport extends StatefulWidget {
  final bool correct;
  const ScoreReport({Key? key, required this.correct}) : super(key: key);
  @override
  _ScoreReport createState() => _ScoreReport();
}

class _ScoreReport extends State<ScoreReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Score Report'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.correct ? 'Your Score is 1' : 'Your Score is 0',
                style: const TextStyle(fontSize: 25, color: Colors.blue,fontWeight: FontWeight.bold)),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}

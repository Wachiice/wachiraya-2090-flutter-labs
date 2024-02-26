//This is local_data_lab12.dart file//

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Score {
  int? id;
  int score;

  Score({this.id, required this.score});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'score': score,
    };
  }

  static Score formMap(Map<String, dynamic> map) {
    return Score(
      id: map['id'],
      score: map['score'],
    );
  }
}

class DatabaseHelper {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), 'scores_database.db');
    debugPrint('DB file patk is $path');

    return openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
        CREATE TABLE scores(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          score INTEGER
        )
''');
  }

  Future<int> insertScore(Score Score) async {
    final db = await database;
    return db.insert('scores', Score.toMap());
  }

  Future<List<Score>> getScores() async {
    final db = await database;
    final List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM scores ORDER BY id DESC LIMIT 3");
    print(maps);
    return List.generate(maps.length, (i) {
      return Score.formMap(maps[i]);
    });
  }

  Future<void> updateScore(Score Score) async {
    final db = await database;
    await db.update('scores', Score.toMap(),
        where: 'id = ?', whereArgs: [Score.id]);
  }
}



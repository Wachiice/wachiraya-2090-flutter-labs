import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FileIOExample(),
    );
  }
}

class FileIOExample extends StatefulWidget {
  @override
  _FileIOExampleState createState() => _FileIOExampleState();
}

class _FileIOExampleState extends State<FileIOExample> {
  TextEditingController _dataController = TextEditingController();
  String _filePath = '';

  @override
  void initState() {
    super.initState();
    _getFilePath();
  }

  Future<void> _getFilePath() async {
    final directory = await getApplicationDocumentsDirectory();
    setState(() {
      _filePath = '${directory.path}/data.txt';
    });
  }

  Future<void> _writeToFile(String data) async {
    final file = File(_filePath);
   await file.writeAsString(data);
  }

  Future<String> _readFromFile() async {
    try {
      final file =File(_filePath);
      return await file.readAsString();
    }catch(e){
      return "Error reading file:$e";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('File IO Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _dataController,
              decoration: const InputDecoration(labelText: 'Enter Data'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                String data = _dataController.text;
                await _writeToFile(data);
                _dataController.text = ""; 
              },
              child: const Text('Write to File'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                String data = await _readFromFile();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Data read from file: $data'),
    
                  ),
                );
              },
              child: const Text('Read from File'),
            ),
          ],
        ),
      ),
    );
  }
}


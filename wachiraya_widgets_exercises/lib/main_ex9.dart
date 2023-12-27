import 'package:flutter/material.dart';
import './app_screens/long_list_exercise.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Form Button Dialog',
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0.0,
        title: const Text('Long ListView'),
        centerTitle: true,
        titleTextStyle: const TextStyle(color: Colors.black, fontSize: 20,)
      ),
      body: getListView(),)));
}
import 'package:flutter/material.dart';
import './app_screens/long_list_snackbar_exercise.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'List View and FAB',
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0.0,
        title: const Text('FAB and SnackBar Exercise'),
        centerTitle: true,
        titleTextStyle: const TextStyle(color: Colors.black, fontSize: 20,)
      ),
      body: const FABSnackBarExercise(),)));
}
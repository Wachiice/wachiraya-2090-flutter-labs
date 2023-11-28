// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Pet App',
      debugShowCheckedModeBanner: false, // Remove the debug banner
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.green),
      ),
      home: const MyHomePage(title: 'My Pet App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class PetName extends StatelessWidget {
  final String name;
  final String image;
  const PetName({Key? key, required this.name, required this.image})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DecoratedBox(
              decoration: const BoxDecoration(
                color: Colors.orange,
              ),
              child:
                  Padding(padding: const EdgeInsets.all(8), 
                  child: Text(name, 
                  style: const TextStyle(fontSize: 20, color: Colors.white)
                  )
                  )
                  ),
            
          Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 50),
            child: Image.asset(image, width: 80, height: 80),
          ),
        ]);
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(widget.title),
        centerTitle: true,
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
      ),
      body: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PetName(name: 'Bird', image: 'images/bird.jpg'),
            SizedBox(width: 50),
            PetName(name: 'Cat', image: 'images/cat.jpg'),
            SizedBox(width: 50),
            PetName(name: 'Dog', image: 'images/dog.jpg'),
          ],
        ),
      ),
    );
  }
}

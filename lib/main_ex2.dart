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
      body: Container(
        color: Colors.grey[200],
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 50, bottom: 50),
              child: Image(
                image: NetworkImage(
                    'https://steemitimages.com/DQmcNvncmbEA5ZBWqdsSQKVUp415MPUapVHnH2dH5Eqi5bU/never%20give%20up.jpg'),
              ),
            ),

            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(30),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.brown[700],
                      border: Border.all(color: Colors.grey, width: 3),
                    ),
                    child: const Text(
                      'Fin Galenz',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 35,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

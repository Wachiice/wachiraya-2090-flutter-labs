import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Favorite Quote',
      debugShowCheckedModeBanner: false, // Remove the debug banner
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: const MyHomePage(title: 'My Favorite Quote' ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)
       
      ),
      body: Container(
        color: Colors.grey[200],

        child: const Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Image widget for your favorite quote
            Padding(
              padding: EdgeInsets.only(top:60,bottom:150),
              child: Image(
                image: NetworkImage('https://steemitimages.com/DQmcNvncmbEA5ZBWqdsSQKVUp415MPUapVHnH2dH5Eqi5bU/never%20give%20up.jpg'),
              ),
            ),
            
            //The first name and the last name of the quote author
             Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Fin',textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 35,color: Colors.brown,fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Galenz',textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 35,color: Colors.brown,fontWeight: FontWeight.bold,
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

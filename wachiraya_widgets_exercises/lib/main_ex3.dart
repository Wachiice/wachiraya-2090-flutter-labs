import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Favorite Quote',
      debugShowCheckedModeBanner: false, // Remove the debug banner
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.green),
      ),
      home: const MyHomePage(title: 'My Favorite Quote'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class PetName extends StatelessWidget{
  final String name,image;
  const PetName({Key? key, required this.name,required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        DecoratedBox(
        decoration: const BoxDecoration(color: Colors.blue,),
        child: Padding(padding:const EdgeInsets.all(8),child:Text(name))
        ),
       Image.network(
        image,
        width:50,
        height: 50,
       ), 
      ]
      );
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
            PetName(name: 'Bird',image:'https://w0.peakpx.com/wallpaper/460/361/HD-wallpaper-rose-bread-and-bunny-red-rabbit-rose-daikichi-bread-manga-cute-anime-bunny-pink.jpg'),
            SizedBox(width: 50),
            PetName(name: 'Cat',image:'https://png.pngtree.com/background/20230612/original/pngtree-bk-dbbs-anime-cute-orange-cat-wallpaper-in-forest-picture-image_3175277.jpg'),
            SizedBox(width: 50),
            PetName(name: 'Dog',image:'https://i.pinimg.com/736x/30/35/25/303525aa53b547c93d4afa6be5a1aca5.jpg'),
          ],
        ),
       
      ),
    );
  }
}


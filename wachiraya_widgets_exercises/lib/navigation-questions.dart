import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int productId = 6430402090; // Replace with your actual product ID

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Home Page'),
          backgroundColor: Colors.grey[50],
          elevation: 0.0,
          centerTitle: true,
          titleTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 20,
          )),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailsPage(productId: productId),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple[100],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: const Text(
            'View Product Details',
            style: TextStyle(
              color: Colors.purple,
            ),
          ),
        ),
      ),
    );
  }
}

class ProductDetailsPage extends StatelessWidget {
  final int productId;

  const ProductDetailsPage({Key? key, required this.productId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Access and display the received product ID here
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        backgroundColor: Colors.grey[50],
        elevation: 0.0,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Text('Product details for ID: $productId '),
      ),
    );
  }
}

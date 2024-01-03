import 'package:flutter/material.dart';

void main() {
 runApp(const MyApp());
}

class LabeledButtonBox extends StatelessWidget {
  final String labelName;
  final String buttonName;

  const LabeledButtonBox({Key? key, required this.labelName, required this.buttonName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(labelName),
        ElevatedButton(
          onPressed: () {},
          child: Text(buttonName),
        ),
      ],
    );
  }
}
class MyApp extends StatelessWidget {
 const MyApp({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     home: Scaffold(
       appBar: AppBar(title: const Text('Custom Widget Exercise1')),
       body: const Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             LabeledButtonBox(
                 labelName: 'Khon Kaen University', buttonName: 'KKU'),
             LabeledButtonBox(
                 labelName: 'University of Michigan', buttonName: 'U-M'),
             LabeledButtonBox(
                 labelName: 'Carnegie Mellon University', buttonName: 'CMU'),
           ],
         ),
       ),
     ),
   );
 }
}



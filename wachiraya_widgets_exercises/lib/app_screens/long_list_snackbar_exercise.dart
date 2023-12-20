import 'package:flutter/material.dart';
import 'long_list_action_exercise.dart';

class FABSnackBarExercise extends StatefulWidget {
  const FABSnackBarExercise ({Key? key}) : super(key: key);

  @override
  FABSnackBarState createState() => FABSnackBarState();
}
class FABSnackBarState extends State<FABSnackBarExercise>{
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getListView(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: (){
          setState(() {
            i++;
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(
                  content: Text('Current counter value is $i'),
                ));
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

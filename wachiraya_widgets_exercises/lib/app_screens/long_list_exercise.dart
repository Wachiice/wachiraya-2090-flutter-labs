import 'package:flutter/material.dart';

@override
Widget getListView() {
  var listView = ListView.builder(
    itemCount: 30,
    itemBuilder: (context, index){
      var indexIsOdd = index.isOdd;
      return ListTile(
        leading: const Icon(Icons.arrow_right),
        trailing: indexIsOdd ? const Icon(Icons.star) : null,
        title: Text("Problem ${index +1}"),
        onTap: (){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(indexIsOdd
              ? "Problem ${index +1} is my favorite"
              : "Problem ${index +1} is selected"),
              ));
          debugPrint(indexIsOdd
            ? "Problem ${index +1} is my favorite"
            : "Problem ${index +1} is selected");
        },
      );
    });
    return listView;
}
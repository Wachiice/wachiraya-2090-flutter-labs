import 'package:flutter/material.dart';

class ListTileFaculty extends StatelessWidget {
  final String facFullName, facShortName;
  final Icon facIcon;
  final Icon? trailingIcon;

  const ListTileFaculty({
    Key? key,
    required this.facFullName,
    required this.facShortName,
    required this.facIcon,
    this.trailingIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: facIcon,
      title: Text(facFullName),
      trailing: trailingIcon,
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Engineering'),
              content: Text(facShortName),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}

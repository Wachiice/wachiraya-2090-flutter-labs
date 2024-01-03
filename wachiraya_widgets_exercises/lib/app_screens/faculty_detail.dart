import 'package:flutter/material.dart';
import 'package:wachiraya_2090_flutter_exercise/data_models/faculty_data_model.dart';

class FacultyDetail extends StatelessWidget {
  final FacultyDataModel facultyDataModel;

  const FacultyDetail(
      {Key? key,
      required this.facultyDataModel,
      required FacultyDataModel faculty})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(facultyDataModel.facultyName),
        backgroundColor: Colors.grey[50],
        centerTitle: true,
        elevation: 0.0,
        titleTextStyle: const TextStyle(color: Colors.black, fontSize: 20),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(30),
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                backgroundColor:
                    MaterialStateProperty.all<Color>(const Color.fromARGB(255, 255, 192, 173)),
              ),
              onPressed: () {},
              child: Text(
                facultyDataModel.facultyLink,
                style: const TextStyle(
                  fontSize: 20,
                  color: Color(0xffA73B24),
                ),
              ),
            ),
          ),
          Text(
            facultyDataModel.facultyNameThai,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color(0xffA73B24),
            ),
          ),
          Expanded(
            child: Image.asset(
              facultyDataModel.imageFile,
            ),
          )
        ],
      ),
    );
  }
}

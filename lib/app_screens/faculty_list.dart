import 'package:flutter/material.dart';
import 'package:wachiraya_2090_flutter_exercise/data_models/faculty_data_model.dart';
import 'package:wachiraya_2090_flutter_exercise/app_screens/faculty_detail.dart';

class FacultyList extends StatefulWidget {
  const FacultyList({Key? key}) : super(key: key);

  @override
  _FacultyListState createState() => _FacultyListState();
}

class _FacultyListState extends State<FacultyList> {
  static List<String> name = ['Engineering', 'Medicine', 'Architecture'];
  static List link = ['https://www.en.kku.ac.th/web/','https://md.kku.ac.th/','https://arch.kku.ac.th/'];
  static List<String> thaiName = ['วิศวกรรมศาสตร์','แพทยศาสตร์','สถาปัตยกรรมศาสตร์'];
  static List<String> asset = ['images/en.jpg','images/md.jpg','images/arch.jpg'];
  final List<FacultyDataModel> facultyData = List.generate(
      name.length,
      (index) => FacultyDataModel(
          name[index], link[index], thaiName[index], asset[index]));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('KKU Faculties'),
          centerTitle: true,
           backgroundColor: Colors.grey[50],
            elevation: 0.0,
            titleTextStyle: const TextStyle(
              color: Colors.black,
              fontSize: 20),
        ),
        body: ListView.builder(
          itemCount: facultyData.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(facultyData[index].facultyName),
                leading: const SizedBox(
                   child: Icon(Icons.arrow_right),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => FacultyDetail(
                            facultyDataModel: facultyData[index], faculty: facultyData[index],
                          )));
                },
              ),
            );
          },
        ));
  }
}

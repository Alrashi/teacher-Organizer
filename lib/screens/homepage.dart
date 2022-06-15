import 'package:flutter/material.dart';
import 'package:teacher_organizer/costumwidgets/studentcard.dart';
import 'package:teacher_organizer/databasehelper.dart';
import 'package:teacher_organizer/models/student.dart';
import 'package:teacher_organizer/screens/studentpage.dart';
import '../constants.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

@override
class _HomePageState extends State<HomePage> {
  DatabaseHelper _dbHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teacher Organizer"),
        backgroundColor: Colors.red,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            FutureBuilder(
                future: _dbHelper.getStudents(),
                builder: (context, AsyncSnapshot<List<Student>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => StudentPage(
                                          storedStudent: snapshot.data![index],
                                          tfEnabled: false,
                                          buttonsColor: Colors.grey,
                                        ))).then((value) {
                              setState(() {});
                            });
                            ;
                          },
                          child: StudentCardWidget(
                              snapshot.data![index].name,
                              snapshot.data![index].lastHomeWork,
                              snapshot.data![index].nextClassStartPoint,
                              snapshot.data![index].numberOfClasses.toString()),
                        );
                      },
                    );
                  }
                  return const Center(
                    child: Text(
                      "No Data!!!",
                      style: TextStyle(color: Color.fromARGB(255, 125, 71, 71)),
                    ),
                  );
                }),
            // Positioned(
            //   bottom: 20,
            //   right: 20,
            //   child: GestureDetector(
            //     onTap: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => StudentPage(
            //             storedStudent: null,
            //             tfEnabled: true,
            //             buttonsColor: Colors.green,
            //           ),
            //         ),
            //       ).then((value) {
            //         setState(() {});
            //       });
            //     },
            //     child: Container(
            //       child: const Image(
            //         image: AssetImage('assets/addbutton2.png'),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StudentPage(
                storedStudent: null,
                tfEnabled: true,
                buttonsColor: Colors.green,
              ),
            ),
          ).then((value) {
            setState(() {});
          });
        },
        backgroundColor: Colors.amber,
        child: const Icon(Icons.add),
      ),
    );
  }
}

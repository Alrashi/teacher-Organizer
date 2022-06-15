import 'package:flutter/material.dart';

class StudentCardWidget extends StatelessWidget {
  final String studentName;
  final String? lastHomework;
  final String? nextClassStartPoint;
  final String numberOfClasses;

  StudentCardWidget(
    this.studentName,
    this.lastHomework,
    this.nextClassStartPoint,
    this.numberOfClasses,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 15.0),
      //color: Colors.grey,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 226, 214, 214),
          borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: [
          Text(
            studentName,
            style: TextStyle(color: Colors.black, fontSize: 21.0),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text('Last Homework: $lastHomework'),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text('Classes taken: $numberOfClasses'),
          )
        ],
      ),
    );
  }
}

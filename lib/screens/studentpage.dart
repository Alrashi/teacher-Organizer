import 'package:flutter/material.dart';
import 'package:teacher_organizer/databasehelper.dart';
import 'package:teacher_organizer/models/student.dart';

class StudentPage extends StatefulWidget {
  final Student? storedStudent;
  bool tfEnabled = true;
  Color buttonsColor = Colors.green;

  StudentPage({
    required this.storedStudent,
    required this.tfEnabled,
    required this.buttonsColor,
  });

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  int _classesCounter = 0;

  var studentNameController = TextEditingController();
  var lastHomeworkController = TextEditingController();
  var nextClassStartPointController = TextEditingController();
  String? nameHintText = "Enter the student's Name";
  String? lastHomeWorkHintText = "Enter the previous Homework";
  String? nextClassStartPointHintText =
      "Enter where to start in the upcomming class";

  void createAndUpdateStudent() async {
    if (widget.storedStudent == null) {
      if (_errorText == null) {
        //isn't it better to make it doppel condition?????????
        setState(() {
          widget.buttonsColor = Colors.grey;
        });
        DatabaseHelper _dbHelper = DatabaseHelper();
        Student _newStudent = Student(
          name: studentNameController.text,
          lastHomeWork: lastHomeworkController.text,
          nextClassStartPoint: nextClassStartPointController.text,
          numberOfClasses: _classesCounter,
        );
        await _dbHelper.createStudent(_newStudent);
        setState(() {
          widget.tfEnabled = false;
        });
        Navigator.pop(context);
      }
    }
    if (_errorText == null) {
      setState(() {
        widget.buttonsColor = Colors.grey;
      });
      updateStudent();
    }
  }

  void updateStudent() async {
    if (widget.storedStudent != null) {
      DatabaseHelper _dbHelper = DatabaseHelper();
      await _dbHelper.updateStudent(
          widget.storedStudent!.id!,
          studentNameController.text,
          lastHomeworkController.text,
          nextClassStartPointController.text,
          _classesCounter);
      Navigator.pop(context);
      print("student Updated");
    }
    setState(() {
      widget.buttonsColor = Colors.grey;
      widget.tfEnabled = false;
    });
  }

  void deleteStudent() async {
    if (widget.storedStudent != null) {
      DatabaseHelper _dbHelper = DatabaseHelper();
      await _dbHelper.deleteStudent(widget.storedStudent!.id!);
      Navigator.pop(context);
      print("student Updated");
    }
  }

// checking that the student name given by user is not empty
  String? get _errorText {
    final text = studentNameController.text;
    if (text.isEmpty) {
      return 'Enter a student name';
    }
    if (text.length < 3) {
      return 'Too short';
    }
    return null;
  }

  void increaseClassesNumber() {
    setState(() {
      _classesCounter++;
    });
  }

  void decreaseClassesNumber() {
    setState(() {
      if (_classesCounter != 0) _classesCounter--;
    });
  }

  @override
  void initState() {
    //checking whether the passed student is null (are we comming from an add new user or from existing user)
    if (widget.storedStudent != null) {
      _classesCounter = widget.storedStudent!.numberOfClasses;
      studentNameController.text = widget.storedStudent!.name;
      lastHomeworkController.text = widget.storedStudent!.lastHomeWork!;
      nextClassStartPointController.text =
          widget.storedStudent!.nextClassStartPoint!;
    }
    // if (widget.tfEnabled == true) {
    //   widget.buttonsColor = Colors.green;
    // }
    // widget.buttonsColor = Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teacher Organizer"),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(30.0),
                      child: TextField(
                        enabled: widget.tfEnabled,
                        controller: studentNameController,
                        decoration: InputDecoration(
                          hintText: nameHintText,
                          errorText: _errorText,
                          icon: Icon(Icons.person),
                        ),
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                        ),
                        // onChanged: (value) {
                        //   setState(() {
                        //     value;
                        //   });
                        //   //1st check: check the user input is not null
                        //   if (value != null) {
                        //     //2nd check: check if the passed student is null because if so it means the user clicked on the creat student button and now we create a new student
                        //     //if it is not null then the user clicked on a student card and he wants to check or update
                        //     if (widget.storedStudent == null) {
                        //       //studentNameController.text = value;
                        //     }
                        //   }
                        // },
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  //controlling the size of the textfield by wrapping it into a container and defining max height with constrains.
                  constraints: const BoxConstraints(maxHeight: 300),
                  child: TextField(
                    enabled: widget.tfEnabled,
                    controller: lastHomeworkController,
                    keyboardType: TextInputType.multiline,
                    maxLines: 2,
                    decoration: InputDecoration(
                        hintText: lastHomeWorkHintText,
                        icon: Icon(Icons.home_work)),
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                    // onChanged: (value) {
                    //   //1st check: check the user input is not null
                    //   if (value != null) {
                    //     //2nd check: check if the passed student is null because if so it means the user clicked on the creat student button and now we create a new student
                    //     //if it is not null then the user clicked on a student card and he wants to check or update
                    //     if (widget.storedStudent == null) {
                    //       lastHomeworkController.text = value;
                    //     } else
                    //       print("you need to update the entry");
                    //   }
                    // },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  //controlling the size of the textfield by wrapping it into a container and defining max height with constrains.
                  constraints: const BoxConstraints(maxHeight: 300),
                  child: TextField(
                    enabled: widget.tfEnabled,
                    controller: nextClassStartPointController,
                    keyboardType: TextInputType.multiline,
                    maxLines: 2,
                    decoration: InputDecoration(
                        hintText: nextClassStartPointHintText,
                        icon: Icon(Icons.next_plan)),
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                    // onChanged: (value) {
                    //   //1st check: check the user input is not null
                    //   if (value != null) {
                    //     //2nd check: check if the passed student is null because if so it means the user clicked on the creat student button and now we create a new student
                    //     //if it is not null then the user clicked on a student card and he wants to check or update
                    //     if (widget.storedStudent == null) {
                    //       nextClassStartPointController.text = value;
                    //     } else
                    //       print("you need to update the entry");
                    //   }
                    // },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton(
                      backgroundColor: widget.buttonsColor,
                      heroTag: "btn1",
                      onPressed: widget.tfEnabled
                          ? () {
                              decreaseClassesNumber();
                            }
                          : null,
                      child: const Icon(Icons.remove),
                    ),
                    Text(
                      "Classes taken: $_classesCounter",
                      style:
                          const TextStyle(fontSize: 30.0, color: Colors.white),
                    ),
                    FloatingActionButton(
                      backgroundColor: widget.buttonsColor,
                      heroTag: "btn2",
                      onPressed: widget.tfEnabled
                          ? () {
                              increaseClassesNumber();
                            }
                          : null,
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    if (widget.tfEnabled == false) {
                      widget.tfEnabled = true;
                      widget.buttonsColor = Colors.green;
                    }
                  });
                },
                icon: const Icon(Icons.edit),
              ),
              IconButton(
                onPressed: () {
                  deleteStudent();
                },
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: widget.tfEnabled
            ? () {
                createAndUpdateStudent();
              }
            : null,
        backgroundColor: Colors.amber,
        child: const Icon(Icons.done),
      ),
    );
  }
}

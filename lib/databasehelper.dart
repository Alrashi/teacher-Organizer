import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'models/student.dart';

class DatabaseHelper {
  Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'teacherOrganizerDB.db'),
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          'CREATE TABLE students(id INTEGER PRIMARY KEY, name TEXT, lastHomeWork TEXT, nextClassStartPoint TEXT, numberOfClasses INTEGER)',
        );
      },
      version: 1,
    );
  }

  Future<void> createStudent(Student student) async {
    Database _db = await database();
    await _db.insert(
      "students",
      student.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Student>> getStudents() async {
    Database _db = await database();
    List<Map<String, dynamic>> studentsMap = await _db.query('students');

    return List.generate(studentsMap.length, (index) {
      return Student(
          id: studentsMap[index]['id'],
          name: studentsMap[index]['name'],
          lastHomeWork: studentsMap[index]['lastHomeWork'],
          nextClassStartPoint: studentsMap[index]['nextClassStartPoint'],
          numberOfClasses: studentsMap[index]['numberOfClasses']);
    });
  }

  Future<void> updateStudent(int id, String name, String? lastHomeWork,
      String nextClassStartPoint, int? numberOfClasses) async {
    Database _db = await database();
    await _db.rawUpdate("UPDATE students SET name = '$name' WHERE id = '$id'");
    await _db.rawUpdate(
        "UPDATE students SET lastHomeWork = '$lastHomeWork' WHERE id = '$id'");
    await _db.rawUpdate(
        "UPDATE students SET nextClassStartPoint = '$nextClassStartPoint' WHERE id = '$id'");
    await _db.rawUpdate(
        "UPDATE students SET numberOfClasses = '$numberOfClasses' WHERE id = '$id'");
  }

  Future<void> deleteStudent(int id) async {
    Database _db = await database();
    await _db.rawDelete("DELETE FROM students WHERE id = '$id'");
  }
}

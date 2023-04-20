import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sample_database/model/data_model.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

Future<void> addStudent(StudentModel value) async {
  studentListNotifier.value.add(value);

  log(value.toString());
  final studentDB = await Hive.openBox<StudentModel>('key_box');
  studentDB.add(value);
  log("worked");
  
  studentListNotifier.notifyListeners();
}

Future<void> getAllStudents() async {
  final studentDB = await Hive.openBox<StudentModel>('key_box');
  studentListNotifier.value.clear();

  studentListNotifier.value.addAll(studentDB.values);
  studentListNotifier.notifyListeners();
}

Future<void> deleteStudent(int id) async {
  final studentDB = await Hive.openBox<StudentModel>('key_box');
  await studentDB.delete(id);
   getAllStudents();
}

Future<void> EditStudentList(StudentModel value, int id) async {
  final studentDB = await Hive.openBox<StudentModel>('key_box');
 await studentDB.put(id, value);
  getAllStudents();
}

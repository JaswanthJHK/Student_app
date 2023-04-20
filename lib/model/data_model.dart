import 'package:hive/hive.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class StudentModel extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String age;

  /* @HiveField(3)
   final String place;
   */

  StudentModel({required this.name, required this.age});
}

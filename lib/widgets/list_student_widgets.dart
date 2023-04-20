import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sample_database/db/functions/db_functions.dart';
import 'package:sample_database/screens/home.dart';
import 'package:sample_database/widgets/edit_student.dart';

import '../model/data_model.dart';

class ListStudentWidget extends StatefulWidget {
  const ListStudentWidget({super.key});

  @override
  State<ListStudentWidget> createState() => _ListStudentWidgetState();
}

class _ListStudentWidgetState extends State<ListStudentWidget> {
 /*  deltest() async {
    final studentDB = await Hive.openBox<StudentModel>('key_box');
    await studentDB.clear();
  } */

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   
  }

  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student List'),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: studentListNotifier,
              builder: (BuildContext ctx, List<StudentModel> studentList,
                  Widget? child) {
                return ListView.separated(
                  itemBuilder: (ctx, index) {
                    final data = studentList[index];
                    return ListTile(
                      title: Text(data.name),
                      subtitle: Text(data.age),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        //--------------------------------------------------------
                        children: [
                          IconButton(
                            onPressed: () async {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        EditStudent(id: data.key),
                                  ));
                            },
                            icon: const Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () async {
                             await deleteStudent(data.key);
                             setState(() {
                               
                             });
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (ctx, index) {
                    return const Divider();
                  },
                  itemCount: studentList.length,
                );
              },
            ),
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ScreenHome(),
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

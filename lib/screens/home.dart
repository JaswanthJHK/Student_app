/* import 'package:flutter/material.dart';
import 'package:sample_database/widgets/add_student_widget.dart';
import 'package:sample_database/widgets/list_student_widgets.dart';

import '../db/functions/db_functions.dart';
import '../model/data_model.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          AddStudentWidget(),

          // const Expanded(
          //   child: ListStudentWidget(),
          // ),
        ],
      )),
     
    );
  }
  // Future<void> onAddStudentButtonClicked() async {
  //   final _name = _nameController.text.trim();
  //   final _age = _ageController.text.trim();
  //   if (_name.isEmpty || _age.isEmpty) {
  //     return;
  //   }
  //   print("$_name $_age");

  //   final _student = StudentModel(name:_name, age:_age);

  //   addStudent(_student);
  // }
}
 */

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_database/widgets/add_student_widget.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
             
              children: [
                Text(
                  "Add Student",
                 
                  style: GoogleFonts.montserrat(
                      color: Colors.amber[400], fontSize: 35,fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 30),
              
                AddStudentWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

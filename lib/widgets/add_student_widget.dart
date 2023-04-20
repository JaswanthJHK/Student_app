import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_database/db/functions/db_functions.dart';
import 'package:sample_database/model/data_model.dart';
import 'package:sample_database/widgets/list_student_widgets.dart';

class AddStudentWidget extends StatelessWidget {
  AddStudentWidget({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(children: [
        CircleAvatar(
          radius: 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
//mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Align(
                      alignment: Alignment.bottomRight,
                      child: Icon(Icons.camera))),
            ],
          ),
          backgroundColor: Colors.amber[400],
        ),
        SizedBox(height: 30),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'User name required';
            } else {
              return null;
            }
          },
          controller: nameController,
          decoration: InputDecoration(
            hintStyle:
                const TextStyle(color: Color.fromARGB(255, 246, 217, 138)),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.amber[400]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.amber[400]!),
            ),
            hintText: 'Name',
          ),
          style: TextStyle(color: Colors.amber[300]),
        ),
        const SizedBox(height: 20),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'User name required';
            } else {
              return null;
            }
          },
          controller: ageController,
          decoration: InputDecoration(
            hintStyle:
                const TextStyle(color: Color.fromARGB(255, 246, 217, 138)),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.amber[400]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.amber[400]!),
            ),
            hintText: 'Age',
          ),
          style: TextStyle(color: Colors.amber[300]),
        ),
        const SizedBox(height: 20),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'User name required';
            } else {
              return null;
            }
          },
          controller: placeController,
          decoration: InputDecoration(
            hintStyle:
                const TextStyle(color: Color.fromARGB(255, 246, 217, 138)),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.amber[400]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.amber[400]!),
            ),
            hintText: 'Place',
          ),
          style: TextStyle(color: Colors.amber[300]),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              onAddStudentButtonClicked();
            } else {}

            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListStudentWidget(),
                ));
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              Colors.amber[400]!,
            ),
          ),
          child: Text(
            "Add Details",
            style: GoogleFonts.montserrat(
              color: Colors.black,
            ),
          ),
        ),
      ]),
    );
  }

  Future<void> onAddStudentButtonClicked() async {
    final _name = nameController.text.trim();
    final _age = ageController.text.trim();

    if (_name.isEmpty || _age.isEmpty) {
      return;
    }
    print("$_name $_age");

    final _student = StudentModel(
      name: _name,
      age: _age,
    );

    addStudent(_student);
  }
}

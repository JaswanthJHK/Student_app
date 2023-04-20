import 'package:flutter/material.dart';
import 'package:sample_database/db/functions/db_functions.dart';
import 'package:sample_database/model/data_model.dart';

class EditStudent extends StatefulWidget {
  final int id;
  EditStudent({super.key, required this.id});

  @override
  State<EditStudent> createState() => _EditStudentState();
}

class _EditStudentState extends State<EditStudent> {
  final _nameController = TextEditingController();

  final _ageController = TextEditingController();

  final _placeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'name',
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _ageController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Age',
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _ageController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Place',
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () {
                         StudentModel student = StudentModel(
                          name: _nameController.text,
                           age: _ageController.text,
                           );
                      EditStudentList(student, widget.id);
                      onAddStudentButtonClicked(); 
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Edit'),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onAddStudentButtonClicked() async {
    final _name = _nameController.text.trim();
    final _age = _ageController.text.trim();
    final _place = _placeController.text.trim();
    if (_name.isEmpty || _age.isEmpty || _place.isEmpty) {
      return;
    }
    Navigator.pop(context);
  }
}

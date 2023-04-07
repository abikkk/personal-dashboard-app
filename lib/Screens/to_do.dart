import 'package:flutter/material.dart';
import 'package:share_wise/Utilities/reusable_appbar.dart';
import 'package:share_wise/Utilities/constants.dart';

class ToDo extends StatefulWidget {
  const ToDo({Key? key}) : super(key: key);

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: Constants.toDo.toUpperCase().replaceAll('-', ' '),),
        body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showToDoBox(false),
        child: const Icon(Icons.add_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }  showToDoBox(bool isEdit) {}
}

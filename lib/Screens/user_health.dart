import 'package:flutter/material.dart';
import 'package:share_wise/Utilities/constants.dart';
import 'package:share_wise/Utilities/reusable_appbar.dart';

class UserHealth extends StatefulWidget {
  const UserHealth({Key? key}) : super(key: key);

  @override
  State<UserHealth> createState() => _UserHealthState();
}

class _UserHealthState extends State<UserHealth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: Constants.userHealth.toUpperCase().replaceAll('-', ' '),),
        body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showHealth(false),
        child: const Icon(Icons.add_rounded),
      ),);
  }    showHealth(bool isEdit) {}

}

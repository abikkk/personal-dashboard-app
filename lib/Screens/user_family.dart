import 'package:flutter/material.dart';
import 'package:share_wise/Utilities/constants.dart';
import 'package:share_wise/Utilities/reusable_appbar.dart';

class UserFamily extends StatefulWidget {
  const UserFamily({Key? key}) : super(key: key);

  @override
  State<UserFamily> createState() => _UserFamilyState();
}

class _UserFamilyState extends State<UserFamily> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: Constants.userFamily.toUpperCase().replaceAll('-', ' ')),
        body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showFamilyBox(false),
        child: const Icon(Icons.add_rounded),
      ),);
  }  showFamilyBox(bool isEdit) {}
}

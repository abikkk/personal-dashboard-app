import 'package:flutter/material.dart';
import 'package:share_wise/Utilities/constants.dart';
import 'package:share_wise/Utilities/reusable_appbar.dart';

class UserLicense extends StatefulWidget {
  const UserLicense({Key? key}) : super(key: key);

  @override
  State<UserLicense> createState() => _UserLicenseState();
}

class _UserLicenseState extends State<UserLicense> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: Constants.userLicense.toUpperCase().replaceAll('-', ' '),),
        body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showLicenseBox(false),
        child: const Icon(Icons.add_rounded),
      ),);
  }  showLicenseBox(bool isEdit) {}

}

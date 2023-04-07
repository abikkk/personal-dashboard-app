import 'package:flutter/material.dart';
import 'package:share_wise/Utilities/constants.dart';
import 'package:share_wise/Utilities/reusable_appbar.dart';
class UserDocuments extends StatefulWidget {
  const UserDocuments({Key? key}) : super(key: key);

  @override
  State<UserDocuments> createState() => _UserDocumentsState();
}

class _UserDocumentsState extends State<UserDocuments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title:Constants.userDocuments.toUpperCase().replaceAll('-', ' '),),
        body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDocumentBox(false),
        child: const Icon(Icons.add_rounded),
      ),);
  }  showDocumentBox(bool isEdit) {}
}

import 'package:flutter/material.dart';
import 'package:share_wise/Utilities/constants.dart';
import 'package:share_wise/Utilities/reusable_appbar.dart';

class SoS extends StatefulWidget {
  const SoS({Key? key}) : super(key: key);

  @override
  State<SoS> createState() => _SoSState();
}

class _SoSState extends State<SoS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: Constants.SOS,
        ),
        body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showSoSBox(false),
        child: const Icon(Icons.add_rounded),
      ),);
  }
  showSoSBox(bool isEdit){

  }
}

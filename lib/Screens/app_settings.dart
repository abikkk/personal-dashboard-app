import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Utilities/constants.dart';
import '../Utilities/reusable_appbar.dart';

class AppSettings extends StatefulWidget {
  const AppSettings({Key? key}) : super(key: key);

  @override
  State<AppSettings> createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
            title: Constants.appSettings.toUpperCase().replaceAll('-', ' ')),
        body:  InkWell(
            onTap: () => Get.toNamed(Constants.privacyPolicy),
            child: const Text('Terms of Service\nPrivacy Policy')));
  }
}

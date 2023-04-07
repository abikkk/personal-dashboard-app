import 'package:flutter/material.dart';

import '../Utilities/constants.dart';
import '../Utilities/reusable_appbar.dart';

class PrivacyAndPolicy extends StatefulWidget {
  const PrivacyAndPolicy({Key? key}) : super(key: key);

  @override
  State<PrivacyAndPolicy> createState() => _PrivacyAndPolicyState();
}

class _PrivacyAndPolicyState extends State<PrivacyAndPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
            title: Constants.privacyPolicy.toUpperCase().replaceAll('-', ' ')),
        body: Container());
  }
}

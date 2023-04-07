import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utilities/constants.dart';
import '../Utilities/reusable_appbar.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: Constants.userProfile.toUpperCase().replaceAll('-', ' ')),
      // body:
    );
  }
}

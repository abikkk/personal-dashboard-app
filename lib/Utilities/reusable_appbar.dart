import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'constants.dart';
import 'shared_preferences.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final bool? showLogout;

  const CustomAppBar({Key? key, required this.title,this.showLogout}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(55);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title.toUpperCase()),
      actions: [
        Visibility(
          visible: (showLogout??false),
          child: IconButton(
              onPressed: () {
                SpUtils.setBool(Constants.rememberLogin, false);
                Get.offAllNamed(Constants.login);
              },
              icon: const Icon(Icons.logout_rounded)),
        )
      ],
    );
  }
}

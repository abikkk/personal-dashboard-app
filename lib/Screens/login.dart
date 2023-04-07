import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_wise/Utilities/shared_preferences.dart';

import '../Utilities/constants.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController idController = TextEditingController(),
      pwController = TextEditingController();
  bool pwVisible = true, loginClicked = false, isRemember = false;
  double loginScale = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSPData();
  }

  getSPData() async {
    SpUtils.getBool(Constants.rememberLogin).then((value) {
      if (value!) {
        Get.offAllNamed(Constants.dashboard);
      } else {
        setState(() {
          isRemember = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 4,
                margin: const EdgeInsets.all(15),
                child: TextFormField(
                  controller: idController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                      labelText: 'Username',
                      // hintText: 'Username',
                      contentPadding: EdgeInsets.symmetric(horizontal: 10)),
                ),
              ),
              Card(
                elevation: 4,
                margin: const EdgeInsets.all(15),
                child: TextFormField(
                  controller: pwController,
                  obscureText: pwVisible,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    labelText: 'Passcode',
                    // hintText: 'Passcode',
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    suffixIcon: IconButton(
                      icon: (!pwVisible)
                          ? const Icon(Icons.visibility_rounded)
                          : const Icon(Icons.visibility_off_rounded),
                      onPressed: () {
                        setState(() {
                          pwVisible = !pwVisible;
                        });
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                        value: isRemember,
                        onChanged: (value) {
                          setState(() {
                            isRemember = value!;
                          });
                          SpUtils.setBool(Constants.rememberLogin, isRemember);
                        }),
                    const Text('Remember me.')
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                        onTap: () {
                          Get.toNamed(Constants.forgotCredentials);
                        },
                        child: const Text('Forgot password?')),
                    InkWell(
                        onTap: () {
                          Get.toNamed(Constants.registerUser);
                        },
                        child: const Text('Sign up')),
                  ],
                ),
              ),
            ],
          ),
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: const [Text('hello world')],
          // )
        ],
      ))),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: InkWell(
          onTap: () async {
            setState(() {
              loginClicked = !loginClicked;
            });
            Future.delayed(const Duration(milliseconds: 150), () {
              setState(() {
                loginClicked = !loginClicked;
              });
              Get.offAllNamed(Constants.dashboard);
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                boxShadow: !loginClicked
                    ? [
                        BoxShadow(
                            color: Colors.grey[500]!,
                            offset: const Offset(5, -5),
                            blurRadius: 10,
                            spreadRadius: 1),
                        const BoxShadow(
                            color: Colors.white,
                            offset: Offset(-5, 5),
                            blurRadius: 10,
                            spreadRadius: 1)
                      ]
                    : null),
            child: AnimatedContainer(
                curve: Curves.easeIn,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                duration: const Duration(milliseconds: 150),
                child: const Icon(
                  Icons.login_rounded,
                  color: Colors.white,
                )),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';
import '../Models/countries.dart';
import '../Utilities/constants.dart';
import '../Utilities/network_calls.dart';
import '../Utilities/reusable_appbar.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({Key? key}) : super(key: key);

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser>
    with SingleTickerProviderStateMixin {
  TextEditingController emailController =
          TextEditingController(text: ''),
      idController = TextEditingController(text: ''),
      pwController = TextEditingController(text: ''),
      countryController = TextEditingController(text: ''),
      phoneController = TextEditingController(text: ''),
      searchController = TextEditingController(text: '');
  bool pwVisible = true,
      isRemember = false,
      isChecking = false,
      isValid = false;
  late AnimationController _validationAnimationController;
  double loginScale = 0.0;
  final _formKey = GlobalKey<FormState>();
  var selectedCountry;
  List<Country> countries = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCountries();
    _validationAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 777));
  }

  getCountries() async {
    // call country API
    await NetworkCalls.getCountriesList().then((value) {
      if (value == null) {
        debugPrint('>> API response null!');
        return;
      } else if (!value.toString().startsWith('>> ')) {
        setState(() {
          countries = value;
          selectedCountry = countries.first;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: Constants.registerUser.toUpperCase().replaceAll('-', ' ')),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  elevation: 4,
                  margin: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: emailController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    onFieldSubmitted: ((email) {
                      // _formKey.currentState!.validate();
                    }),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '*field required!';
                      } else if (!EmailValidator.validate(value)) {
                        return 'Invalid email address';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        labelText: 'E-mail',
                        // hintText: 'Username',
                        contentPadding: EdgeInsets.symmetric(horizontal: 10)),
                  ),
                ),
                Card(
                  elevation: 4,
                  margin: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: countryController,
                    // initialValue: selectedCountry.name,
                    readOnly: true,
                    onTap: () {
                      showCountrySelector();
                    },
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: ((country) {
                      // _formKey.currentState!.validate();
                    }),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '*field required!';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        labelText: 'Country',
                        // hintText: 'Country',
                        contentPadding: EdgeInsets.symmetric(horizontal: 10)),
                  ),
                ),
                Card(
                  elevation: 4,
                  margin: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: phoneController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    onFieldSubmitted: ((username) {
                      // _formKey.currentState!.validate();
                    }),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '*field required!';
                      } else if (!value.isNumericOnly) {
                        return 'Invalid phone number!';
                      } else if (value.length != 10 && value.length != 13) {
                        return 'Invalid phone number length!';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        prefix: InkWell(
                            onTap: () {
                              showCountrySelector();
                            },
                            child: Text(
                                '+ ${selectedCountry == null ? '' : selectedCountry.callingCodes.first ?? ''}')),
                        labelText: 'Phone Number',
                        // hintText: 'Phone Number',
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10)),
                  ),
                ),
                Card(
                  elevation: 4,
                  margin: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: idController,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: ((username) {
                      // _formKey.currentState!.validate();
                    }),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '*field required!';
                      } else if (!value.isAlphabetOnly) {
                        return 'Your username should only contain alphabets!';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        labelText: 'Username',
                        // hintText: 'Username',
                        contentPadding: EdgeInsets.symmetric(horizontal: 10)),
                  ),
                ),
                Card(
                  elevation: 4,
                  margin: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: pwController,
                    obscureText: pwVisible,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: ((passcode) {}),
                    validator: (value) {
                      if (value!.isEmpty || value.isBlank!) {
                        return '*field required!';
                      } else if (value.contains(idController.text)) {
                        return 'Password too similar to your username!';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Passcode',
                      // hintText: 'Passcode',
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 10),
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
                Container(
                    width: 120.0,
                    height: 120.0,
                    margin: const EdgeInsets.only(
                      top: 25.0,
                      bottom: 60.0,
                    ),
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      color: Colors.indigo,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 3),
                            blurRadius: 2,
                            spreadRadius: 2)
                      ],
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_a_photo_outlined,
                        size: 30,
                      ),
                      color: Colors.white,
                    )),
              ],
            ),
          ),
        ],
      ))),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: InkWell(
          onTap: () async {
            setState(() {
              isChecking = !isChecking;
              isChecking
                  ? _validationAnimationController.forward()
                  : _validationAnimationController.reverse();
            });
            Future.delayed(const Duration(seconds: 1), () {
              setState(() {
                isChecking = !isChecking;
                isChecking
                    ? _validationAnimationController.forward()
                    : _validationAnimationController.reverse();
              });
              if (_formKey.currentState!.validate()) {
                setState(() {
                  isValid = true;
                });
                // show success dialog
                Get.defaultDialog(
                  barrierDismissible: false,
                  title: ('Congrats!'),
                  titlePadding: const EdgeInsets.symmetric(vertical: 15),
                  titleStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 20),
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Icon(
                          Icons.done_all_sharp,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: AnimatedTextKit(
                          animatedTexts: [
                            RotateAnimatedText('You just created your account!',
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white),
                                duration: const Duration(seconds: 2),
                                rotateOut: true),
                            RotateAnimatedText(
                                'Please check you email to confirm your account.',
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white),
                                duration: const Duration(milliseconds: 300),
                                rotateOut: false),
                          ],
                          repeatForever: false,
                          isRepeatingAnimation: false,
                          displayFullTextOnTap: true,
                        ),
                      )
                    ],
                  ),
                  textConfirm: 'Yay!',
                  confirmTextColor: Colors.white,
                  onConfirm: () => Get.offAllNamed(Constants.login),
                  backgroundColor: Theme.of(context).primaryColor,
                ).whenComplete(() => setState(() {
                      isChecking = !isChecking;
                      isChecking
                          ? _validationAnimationController.forward()
                          : _validationAnimationController.reverse();
                    }));
              }
              // Get.offAllNamed(Constants.DASHBOARD);
            });
          },
          child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  boxShadow: !isChecking
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
              child: SizedBox(
                height: 55,
                child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 350),
                    transitionBuilder: (child, anim) => RotationTransition(
                          turns: child.key == const ValueKey('icon1')
                              ? Tween<double>(begin: 1.75, end: 1).animate(anim)
                              : Tween<double>(begin: 1.5, end: 1).animate(anim),
                          child: ScaleTransition(scale: anim, child: child),
                          // child: FadeTransition(opacity: anim, child: child),
                        ),
                    child: (isChecking)
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              key: ValueKey('icon2'),
                              color: Colors.white,
                            ),
                          )
                        : Container(
                            child: Icon(
                              (isValid)
                                  ? Icons.check_rounded
                                  : Icons.navigate_next,
                              color: Colors.white,
                              key: const ValueKey('icon1'),
                            ),
                          )),
              )),
        ),
      ),
    );
  }

  showCountrySelector() {
    return Get.bottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), topLeft: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      (countries.isNotEmpty)
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  itemCount: countries.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: InkWell(
                        onTap: () {
                          // getting country codes API
                          setState(() {
                            selectedCountry = countries[index];
                            countryController.text = selectedCountry.name;
                          });
                          Navigator.pop(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              countries[index].name ?? '',
                            ),
                            Text(
                              '+${countries[index].callingCodes?.first}',
                            ),
                          ],
                        ),
                      ),
                      // leading: Text("${index + 1}")
                    );
                  }),
            )
          : const Text('No country data imported!'),
    );
  }
}

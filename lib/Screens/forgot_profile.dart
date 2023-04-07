import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';
import '../Models/countries.dart';
import '../Utilities/constants.dart';
import '../Utilities/network_calls.dart';
import '../Utilities/reusable_appbar.dart';

class ForgotCredentials extends StatefulWidget {
  const ForgotCredentials({Key? key}) : super(key: key);

  @override
  State<ForgotCredentials> createState() => _ForgotCredentialsState();
}

class _ForgotCredentialsState extends State<ForgotCredentials>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController =
          TextEditingController(text: 'abikvaidhya@gmail.com'),
      phoneController = TextEditingController(text: ''),
      emailOTPController = TextEditingController(text: ''),
      phoneOTPController = TextEditingController(text: '');
  var selectedCountry;
  List<Country> countries = [];
  bool isChecking = false, isValid = false;
  late AnimationController _validationAnimationController;

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
          title:
              Constants.forgotCredentials.toUpperCase().replaceAll('-', ' ')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Form(
              key: _formKey,
              child: Column(
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
                ],
              ),
            ),
          ],
        ),
      ),
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
                  title: ('Verification'),
                  titlePadding: const EdgeInsets.symmetric(vertical: 15),
                  titleStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 20),
                  content: Column(
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
                      TextFormField(
                        controller: emailOTPController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        maxLength: 6,
                        onFieldSubmitted: ((emailOTP) {
                          // _formKey.currentState!.validate();
                        }),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return '*field required!';
                          } else if (!value.isNumericOnly) {
                            return 'Invalid email OTP!';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            labelText: 'E-mail OTP',
                            labelStyle: TextStyle(color: Colors.white),
                            // hintText: 'E-mail OTP',
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10)),
                      ),
                      TextFormField(
                        controller: phoneOTPController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        maxLength: 6,
                        onFieldSubmitted: ((phoneOTP) {
                          // _formKey.currentState!.validate();
                        }),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return '*field required!';
                          } else if (!value.isNumericOnly) {
                            return 'Invalid phone OTP!';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            labelText: 'Phone OTP',
                            // hintText: 'Phone OTP',
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10)),
                      ),
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
                            // countryController.text = selectedCountry.name;
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

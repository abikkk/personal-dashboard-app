import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utilities/constants.dart';
import '../Utilities/reusable_appbar.dart';

class UserWallet extends StatefulWidget {
  const UserWallet({Key? key}) : super(key: key);

  @override
  State<UserWallet> createState() => _UserWalletState();
}

class _UserWalletState extends State<UserWallet> {
  List<String> cardList = [];
  TextEditingController cardFName = TextEditingController(),
      cardLName = TextEditingController(),
      cardNumber = TextEditingController(),
      cardCVV = TextEditingController(),
      cardExpiry = TextEditingController();
  List<String> cardTypes = [
    'Visa',
    'Bank Credit',
    'Bank Debit',
    'PayPal',
    'Others'
  ];
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeCardList();
  }

  initializeCardList() {
    cardList.add('bank');
    cardList.add('credit');
    cardList.add('visa');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: Constants.userWallet.toUpperCase().replaceAll('-', ' ')),
      body: ListView.builder(
          itemCount: cardList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                title: Card(
                    elevation: 2,
                    child: Container(
                        padding: const EdgeInsets.all(10),
                        height: MediaQuery.of(context).size.height / 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Expanded(child: Text("Card Holder: ")),
                            Expanded(child: Text("Card: ${cardList[index]}")),
                          ],
                        ))));
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showCardBox(false),
        child: const Icon(Icons.add_rounded),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  showCardBox(bool isEdit) {
    final formKey = GlobalKey<FormState>();
    Get.defaultDialog(
        title: (isEdit) ? 'Modify Card' : 'Add Card',
        titlePadding: const EdgeInsets.symmetric(vertical: 25),
        content: StatefulBuilder(builder: (context, setState) {
          return Form(
            key: formKey,
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: MediaQuery.of(context).size.height / 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 2.0),
                            child: TextFormField(
                              controller: cardFName,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              onFieldSubmitted: ((email) {
                                // _formKey.currentState!.validate();
                              }),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return '*field required!';
                                } else if (!value.isAlphabetOnly) {
                                  return 'Your name should only contain alphabets!';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                  labelText: 'First name',
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10)),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 2.0),
                            child: TextFormField(
                              controller: cardLName,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              onFieldSubmitted: ((email) {
                                // _formKey.currentState!.validate();
                              }),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return '*field required!';
                                } else if (!value.isAlphabetOnly) {
                                  return 'Your name should only contain alphabets!';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                  labelText: 'Last name',
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex:5,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 2.0),
                            child: TextFormField(
                              controller: cardNumber,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              maxLength: 16,
                              onFieldSubmitted: ((cardNo) {
                                // _formKey.currentState!.validate();
                              }),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return '*field required!';
                                } else if (!value.isNumericOnly) {
                                  return 'Invalid Card Number!';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                  labelText: 'Card number',
                                  contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10)),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 2.0),
                            child: TextFormField(
                              controller: cardCVV,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              maxLength: 3,
                              onFieldSubmitted: ((cardNo) {
                                // _formKey.currentState!.validate();
                              }),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return '*field required!';
                                } else if (!value.isNumericOnly) {
                                  return 'Invalid Card Verification Value!';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                  labelText: 'CVV',
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                      readOnly: true,
                      controller: cardExpiry,
                      textInputAction: TextInputAction.next,
                      // keyboardType: TextInputType.name,

                      onFieldSubmitted: ((email) {
                        // _formKey.currentState!.validate();
                      }),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '*field required!';
                        } else if (!value.isAlphabetOnly) {
                          return 'Your name should only contain alphabets!';
                        }
                        return null;
                      },

                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () => _selectDate(context),
                              icon: const Icon(
                                Icons.calendar_month_outlined,
                                color: Colors.indigo,
                              )),
                          labelText: 'Expiry date',
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 10)),
                    ),
                  ],
                )),
          );
        }),
        contentPadding: const EdgeInsets.symmetric(vertical: 25),
        textConfirm: 'Done',
        onConfirm: () => Navigator.pop(context),
        confirmTextColor: Colors.white,
        textCancel: 'Cancel',
        // onCancel: () => Navigator.pop(context),
        cancelTextColor: Colors.indigo);
  }
}

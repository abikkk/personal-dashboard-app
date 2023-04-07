import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_wise/Utilities/constants.dart';
import 'package:share_wise/Utilities/reusable_appbar.dart';

import '../Models/shopping_cart.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({Key? key}) : super(key: key);

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  List<CartItem> cartList = [];
  bool isChecked = false;
  String title = 'item';
  String subtitle = 'qty/description';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: Constants.shoppingCart.toUpperCase().replaceAll('-', ' ')),
      body: (cartList.isNotEmpty)
          ? Container(
              color: Colors.red,
              child: ListView.builder(
                itemCount: cartList.length,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (BuildContext context, int i) {
                  return Dismissible(
                    key: Key(cartList[i].title),
                    onDismissed: (direction) {
                      setState(() {
                        cartList.removeAt(i);
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Removed!')));
                    },
                    child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: CheckboxListTile(
                              value: cartList[i].isChecked,
                              title: Text(cartList[i].title),
                              subtitle: Text(cartList[i].subtitle),
                              onChanged: (value) {
                                setState(() {
                                  cartList[i].isChecked = value!;
                                });
                              },
                              secondary: (cartList[i].isChecked)
                                  ? Container()
                                  : InkWell(
                                      onTap: () => showEdit(cartList[i], i),
                                      child: const Icon(Icons.edit_sharp)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          : const Center(child: Text('No items!')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addItem(false),
        child: const Icon(Icons.add_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  showEdit(CartItem item, int counter) {
    TextEditingController title = TextEditingController(text: item.title),
        subtitle = TextEditingController(text: item.subtitle);
    final editKey = GlobalKey<FormState>();

    return Get.defaultDialog(
        barrierDismissible: false,
        title: "Edit",
        // titlePadding: EdgeInsets.only(top: 10),
        content: Form(
          key: editKey,
          child: Column(
            children: [
              TextFormField(
                controller: title,
                decoration: const InputDecoration(label: Text('Item')),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return '*field required!';
                  }
                  return null;
                },
                onFieldSubmitted: (value) {
                  if (value.isNotEmpty) {
                    item.title = value;
                  }
                },
              ),
              TextFormField(
                controller: subtitle,
                decoration: const InputDecoration(label: Text('Description')),
                textInputAction: TextInputAction.done,
                validator: (value) {
                  if (value!.isEmpty) {
                    return '*field required!';
                  }
                  return null;
                },
                onFieldSubmitted: (value) {
                  if (value.isNotEmpty) {
                    item.subtitle = value;
                  }
                },
              ),
            ],
          ),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        onConfirm: () {
          if (editKey.currentState!.validate()) {
            debugPrint('${item.title} : ${item.subtitle}');
            item.title = title.text;
            item.subtitle = subtitle.text;
            setState(() {
              cartList[counter] = item;
            });
            Navigator.pop(context);
          }
        },
        confirmTextColor: Colors.white,
        radius: 30);
  }

  addItem(bool isEdit) {
    setState(() {
      cartList.add(
          CartItem(isChecked: false, title: 'item', subtitle: 'description'));
    });
  }
}

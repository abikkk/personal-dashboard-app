import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utilities/constants.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

import '../Utilities/reusable_neo_card.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final _advancedDrawerController = AdvancedDrawerController();
  bool showLicense = true,
      showWallet = true,
      showFamily = true,
      showHealth = true,
      showDocument = true,
      showSOS = true;

  @override
  void initState() {
    super.initState();
    _advancedDrawerController.showDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: Colors.indigoAccent,
      controller: _advancedDrawerController,
      animationCurve: Curves.decelerate,
      animationDuration: const Duration(milliseconds: 100),
      animateChildDecoration: true,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black26,
              offset: Offset(-8, 10),
              blurRadius: 2,
              spreadRadius: 2)
        ],
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      drawer: SafeArea(
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                  width: 140.0,
                  height: 140.0,
                  margin: const EdgeInsets.only(
                    top: 25.0,
                    bottom: 60.0,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                      color: Colors.black45,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(-6, 5),
                            blurRadius: 2,
                            spreadRadius: 2)
                      ]),
                  child: const Icon(
                    Icons.account_circle_sharp,
                    color: Colors.white,
                  )),
              ListTile(
                onTap: () => Get.toNamed(Constants.toDo),
                leading: const Icon(Icons.checklist_rtl_sharp),
                title: const Text('To-Do'),
              ),
              ListTile(
                onTap: () => Get.toNamed(Constants.shoppingCart),
                leading: const Icon(Icons.shopping_cart_outlined),
                title: const Text('Shopping'),
              ),
              const Spacer(),
              ListTile(
                  // onTap: () => Get.toNamed(Constants.appSettings),
                  leading: IconButton(
                      icon: const Icon(Icons.logout_sharp),
                      onPressed: () => Get.offAllNamed('/')),
                  trailing: IconButton(
                    icon: const Icon(Icons.settings),
                    onPressed: () => Get.toNamed(Constants.appSettings),
                  )),
              // ),
            ],
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.dashboard_sharp),
            onPressed: () => _advancedDrawerController.showDrawer(),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  // open dialog box to change the layout in the dashboard
                  showRearrangeBox();
                },
                icon: const Icon(Icons.edit_sharp))
          ],
          title: Text(Constants.dashboard.toUpperCase()),
        ),
        // drawer:
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(2.5),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: [
                      Visibility(
                        visible: showLicense,
                        child: Expanded(
                          child: Column(
                            children: const [
                              Expanded(
                                  child: Padding(
                                padding: EdgeInsets.all(8),
                                child: CustomNeoCard(
                                  tile: Constants.dashboardTile11,
                                ),
                              )),
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                        visible: (showWallet || showFamily),
                        child: Expanded(
                          child: Column(
                            children: [
                              Visibility(
                                visible: showWallet,
                                child: const Expanded(
                                    child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: CustomNeoCard(
                                    tile: Constants.dashboardTile21,
                                  ),
                                )),
                              ),
                              Visibility(
                                visible: showFamily,
                                child: const Expanded(
                                    child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: CustomNeoCard(
                                    tile: Constants.dashboardTile22,
                                  ),
                                )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Visibility(
                        visible: showHealth,
                        child: Expanded(
                          child: Column(
                            children: const [
                              Expanded(
                                  child: Padding(
                                padding: EdgeInsets.all(8),
                                child: CustomNeoCard(
                                    tile: Constants.dashboardTile13),
                              )),
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                        visible: (showDocument || showSOS),
                        child: Expanded(
                          child: Row(
                            children: [
                              Visibility(
                                visible: showDocument,
                                child: const Expanded(
                                    child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: CustomNeoCard(
                                    tile: Constants.dashboardTile14,
                                  ),
                                )),
                              ),
                              Visibility(
                                visible: showSOS,
                                child: const Expanded(
                                    child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: CustomNeoCard(
                                    tile: Constants.dashboardTile24,
                                  ),
                                )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  showRearrangeBox() {
    return Get.defaultDialog(
        title: 'Re-arrange dashboard',
        titlePadding: const EdgeInsets.symmetric(vertical: 25),
        backgroundColor: Colors.white,
        barrierDismissible: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        content: StatefulBuilder(builder: (context, setState) {
          return Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('License'),
                    IconButton(
                        icon: (showLicense)
                            ? const Icon(Icons.visibility_sharp)
                            : const Icon(Icons.visibility_off_sharp),
                        onPressed: () {
                          setState(() {
                            showLicense = !showLicense;
                          });
                        })
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Wallet'),
                    IconButton(
                        icon: (showWallet)
                            ? const Icon(Icons.visibility_sharp)
                            : const Icon(Icons.visibility_off_sharp),
                        onPressed: () {
                          setState(() {
                            showWallet = !showWallet;
                          });
                        })
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Family'),
                    IconButton(
                        icon: (showFamily)
                            ? const Icon(Icons.visibility_sharp)
                            : const Icon(Icons.visibility_off_sharp),
                        onPressed: () {
                          setState(() {
                            showFamily = !showFamily;
                          });
                        })
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Health'),
                    IconButton(
                        icon: (showHealth)
                            ? const Icon(Icons.visibility_sharp)
                            : const Icon(Icons.visibility_off_sharp),
                        onPressed: () {
                          setState(() {
                            showHealth = !showHealth;
                          });
                        })
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Documents'),
                    IconButton(
                        icon: (showDocument)
                            ? const Icon(Icons.visibility_sharp)
                            : const Icon(Icons.visibility_off_sharp),
                        onPressed: () {
                          setState(() {
                            showDocument = !showDocument;
                          });
                        })
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('SOS'),
                    IconButton(
                        icon: (showSOS)
                            ? const Icon(Icons.visibility_sharp)
                            : const Icon(Icons.visibility_off_sharp),
                        onPressed: () {
                          setState(() {
                            showSOS = !showSOS;
                          });
                        })
                  ],
                ),
              ],
            ),
          );
        }),
        confirmTextColor: Colors.white,
        textConfirm: 'Done',
        onConfirm: () {
          setState(() {
            Navigator.pop(context);
          });
        });
  }
}

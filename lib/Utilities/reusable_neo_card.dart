import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'constants.dart';

class CustomNeoCard extends StatefulWidget {
  final String? tile;

  const CustomNeoCard({Key? key, this.tile}) : super(key: key);

  @override
  State<CustomNeoCard> createState() => _CustomNeoCardState();
}

class _CustomNeoCardState extends State<CustomNeoCard> {
  bool buttonClicked = false;

  // double cardScale=0.0,cardPad=0.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: InkWell(
            onTap: () async {
              setState(() {
                buttonClicked = !buttonClicked;
              });
              Future.delayed(const Duration(milliseconds: 100), () {
                setState(() {
                  buttonClicked = !buttonClicked;
                });

                Get.toNamed(openLink(widget.tile!));
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 50),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: !buttonClicked
                      ? [
                          BoxShadow(
                              color: Colors.grey[500]!,
                              offset: const Offset(4, 4),
                              blurRadius: 15,
                              spreadRadius: 1),
                          const BoxShadow(
                              color: Colors.white,
                              offset: Offset(-4, -4),
                              blurRadius: 15,
                              spreadRadius: 1)
                        ]
                      : null),
              child: Center(child: buildIcon(widget.tile!)),
            ),
          ),
        ),
      ],
    );
  }

  openLink(tile) {
    switch (tile) {
      case Constants.dashboardTile11:
        {
          return Constants.userLicense;
        }
      case Constants.dashboardTile21:
        {
          return Constants.userWallet;
        }
      case Constants.dashboardTile22:
        {
          return Constants.userFamily;
        }
      case Constants.dashboardTile13:
        {
          return Constants.userHealth;
        }
      case Constants.dashboardTile14:
        {
          return Constants.userDocuments;
        }
      case Constants.dashboardTile24:
        {
          return Constants.SOS;
        }
      default:
        {
          return Text(tile);
        }
    }
  }

  Widget buildIcon(String tile) {
    switch (tile) {
      case Constants.dashboardTile11:
        {
          return Icon(
            Icons.badge_rounded,
            size: 40,
            color: Theme.of(context).primaryColor,
          );
        }
      case Constants.dashboardTile21:
        {
          return Icon(
            Icons.account_balance_wallet_rounded,
            size: 40,
            color: Theme.of(context).primaryColor,
          );
        }
      case Constants.dashboardTile22:
        {
          return Icon(
            Icons.family_restroom_rounded,
            size: 40,
            color: Theme.of(context).primaryColor,
          );
        }
      case Constants.dashboardTile13:
        {
          return Icon(
            Icons.health_and_safety_sharp,
            size: 40,
            color: Theme.of(context).primaryColor,
          );
        }
      case Constants.dashboardTile14:
        {
          return Icon(
            Icons.feed_rounded,
            size: 40,
            color: Theme.of(context).primaryColor,
          );
        }
      case Constants.dashboardTile24:
        {
          return Icon(
            Icons.emergency_sharp,
            size: 40,
            color: Theme.of(context).primaryColor,
          );
        }
      default:
        {
          return Text(tile);
        }
    }
  }
}

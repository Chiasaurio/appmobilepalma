import 'package:apppalma/presentation/constants.dart';
import 'package:flutter/material.dart';

class PalmaTabBar extends StatefulWidget {
  const PalmaTabBar({
    required this.onTap,
    required this.rightTab,
    required this.textLeft,
    required this.textRight,
    Key? key,
  }) : super(key: key);

  final VoidCallback onTap;
  final bool rightTab;
  final String textLeft;
  final String textRight;

  @override
  PalmaTabBarState createState() => PalmaTabBarState();
}

class PalmaTabBarState extends State<PalmaTabBar>
    with TickerProviderStateMixin {
  int indexSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildTab(widget.textLeft, !widget.rightTab),
          buildTab(widget.textRight, widget.rightTab),
        ],
      ),
    );
  }

  Widget buildTab(String text, bool isSelected) {
    if (isSelected) {
      return Expanded(
        child: GestureDetector(
          onTap: widget.onTap,
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: kpurpleColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: Container(
              decoration: const BoxDecoration(
                color: kblueColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: isSelected ? kPrimaryColor : Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      return Expanded(
        child: GestureDetector(
          onTap: widget.onTap,
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              // border: Border(),
              color: kBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: Container(
              decoration: const BoxDecoration(
                color: kblueColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: isSelected ? kPrimaryColor : Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}

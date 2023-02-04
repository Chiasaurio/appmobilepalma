import 'package:flutter/material.dart';

class WhiteAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const WhiteAppBar({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0.0,
      leading: Container(
        decoration: const BoxDecoration(shape: BoxShape.circle),
        margin: const EdgeInsets.only(left: 10),
        child: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          iconSize: 25,
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 25,
          ),
        ),
      ),
      leadingWidth: 50,
      backgroundColor: Colors.white,
      elevation: 0.0,
      title: Text(
        title,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}

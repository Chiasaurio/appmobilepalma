import 'package:flutter/material.dart';

class LogoSigpa extends StatelessWidget {
  const LogoSigpa({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [
          Image.asset("assets/images/palm-tree.png", fit: BoxFit.cover, height: 100),
          Text(
            'SIGPA',
            style: Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(color: Color(0xFFff5d35), fontWeight: FontWeight.w900, fontSize: 30),
          ),
        ],
      ),
    );
  }
}

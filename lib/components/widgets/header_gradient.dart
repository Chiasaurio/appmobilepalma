import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../constants.dart';

class HeaderGradient extends StatelessWidget {
  HeaderGradient({
    Key? key,
    required this.title,
    required this.ruta,
    this.onPop,
  }) : super(key: key);
  final String title;
  final String ruta;
  final VoidCallback? onPop;
  final Color colorBlanco = Colors.white.withOpacity(0.7);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(0)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [kpurpleColor, kblueColor])),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).padding.top),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 75.0),
              child: Text(ruta,
                  style: TextStyle(
                      fontSize: 15,
                      color: colorBlanco,
                      fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      if (onPop != null) {
                        onPop!();
                      }
                    },
                    child: FaIcon(FontAwesomeIcons.arrowLeft,
                        size: 25, color: Colors.white.withOpacity(0.7)),
                  ),
                  const SizedBox(width: 30),
                  Text(title,
                      style: TextStyle(
                          fontSize: 25,
                          color: colorBlanco,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            )
          ]),
    );
  }
}

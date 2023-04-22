import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../constants.dart';

class HeaderEnfermedad extends StatelessWidget {
  const HeaderEnfermedad({
    Key? key,
    required this.colorBlanco,
  }) : super(key: key);

  final Color colorBlanco;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [kpurpleColor, kblueColor])),
      child: Column(children: <Widget>[
        SizedBox(height: MediaQuery.of(context).padding.top),
        const SizedBox(
          height: 40,
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
                },
                child: FaIcon(FontAwesomeIcons.arrowLeft,
                    size: 25, color: Colors.white.withOpacity(0.7)),
              ),
              const SizedBox(width: 30),
              Text("Registrar enfermedad",
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

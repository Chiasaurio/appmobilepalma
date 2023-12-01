import 'package:flutter/material.dart';

import '../../../../constants.dart';

class OpcionGreenItem extends StatelessWidget {
  final String nombreLote;
  final String text;
  final String ruta;

  const OpcionGreenItem(
      {Key? key,
      required this.nombreLote,
      required this.ruta,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ruta, arguments: nombreLote);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey),
          color: kLightGreen,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        width: double.infinity,
        height: 50,
        // child:
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  textAlign: TextAlign.center,
                ),
                const Icon(Icons.arrow_forward)
              ],
            ),
          ]),
        ),
        // ),
      ),
    );
  }
}

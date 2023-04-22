import 'package:apppalma/presentation/constants.dart';
import 'package:flutter/material.dart';

import 'package:apppalma/data/moor/tables/lotes_table.dart';

class LoteLocalInformation extends StatelessWidget {
  const LoteLocalInformation({Key? key, required this.lote}) : super(key: key);
  final LoteWithProcesos lote;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
          color: Colors.black,
          // color: kBackgroundColor,
          // border: Border.all(
          //   color: Color(0XFF172C5329),
          // ),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Avisos: ',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 5.0),
            lote.cosecha != null
                ? Row(children: [
                    Container(
                      width: 15.0,
                      height: 15.0,
                      decoration: const BoxDecoration(
                        color: kYellowColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 20),
                    const Text(
                      'Cosecha pendiente ',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ])
                : const SizedBox(),
            lote.poda != null
                ? Row(children: [
                    Container(
                      width: 15.0,
                      height: 15.0,
                      decoration: const BoxDecoration(
                        color: kYellowColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 20),
                    const Text(
                      'Poda pendiente ',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ])
                : const SizedBox(),
            lote.plateo != null
                ? Row(children: [
                    Container(
                      width: 15.0,
                      height: 15.0,
                      decoration: const BoxDecoration(
                        color: kYellowColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 20),
                    const Text(
                      'Plateo pendiente ',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ])
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

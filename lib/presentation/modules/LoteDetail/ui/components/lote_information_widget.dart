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
            if (lote.cosecha != null)
              Row(children: [
                const SizedBox(width: 5),
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
              ]),
            if (lote.poda != null)
              Row(children: [
                const SizedBox(width: 5),
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
              ]),
            if (lote.plateo != null)
              Row(children: [
                const SizedBox(width: 5),
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
              ]),
            if (lote.fertilizacion != null)
              Row(children: [
                const SizedBox(width: 5),
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
                  'Fertilización pendiente ',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ]),
            if (lote.palmaspendientes?.isNotEmpty ?? false)
              Row(children: [
                const SizedBox(width: 10),
                Text(
                    lote.palmaspendientes!
                        .where((element) =>
                            element.estadopalma ==
                            EstadosPalma.pendientePorTratar)
                        .length
                        .toString(),
                    style: const TextStyle(color: Colors.red)),
                const SizedBox(width: 10),
                const Text(
                  'Palmas pendiente por tratar ',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ]),
            if (lote.censospendientes?.isNotEmpty ?? false)
              Row(children: [
                const SizedBox(width: 10),
                Text(lote.censospendientes!.length.toString(),
                    style: const TextStyle(color: Colors.red)),
                const SizedBox(width: 10),
                const Text(
                  'Censos pendientes por tratar ',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ]),
          ],
        ),
      ),
    );
  }
}

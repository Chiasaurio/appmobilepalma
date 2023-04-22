import 'package:apppalma/presentation/constants.dart';
import 'package:apppalma/data/moor/tables/lotes_table.dart';
import 'package:apppalma/presentation/modules/LoteDetail/ui/widgets/opciones_fitosanitaria.dart';
import 'package:apppalma/presentation/modules/LoteDetail/ui/widgets/opciones_productiva.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key, required this.lote}) : super(key: key);
  final LoteWithProcesos lote;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String nombrelote = '';
  String? opcionSelected;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          buildOpcion("Fitosanitaria", Icons.healing),
          const SizedBox(
            width: 30,
          ),
          buildOpcion("Productiva", Icons.price_check_outlined),
        ]),
        if (opcionSelected != null) buildOpciones()
      ],
    );
  }

  buildOpciones() {
    if (opcionSelected == "Fitosanitaria") {
      return OpcionesProductiva(
        nombreLote: widget.lote.lote.nombreLote,
      );
    } else {
      return OpcionesFitosanitaria(
        lote: widget.lote,
      );
    }
  }

  Widget buildOpcion(String text, IconData icon) {
    final isSelected = opcionSelected != null && opcionSelected == text;
    return GestureDetector(
      onTap: () {
        opcionSelected = text;
        setState(() {});
      },
      child: Container(
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isSelected ? kblueColor : Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              child: Icon(icon, size: 50, color: Colors.blueAccent),
            ),
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12))),
              padding: const EdgeInsets.all(12),
              child: Text(
                text,
                style: const TextStyle(fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}

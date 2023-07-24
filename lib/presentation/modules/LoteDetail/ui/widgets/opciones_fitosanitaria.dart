import 'package:flutter/material.dart';

class OpcionesFitosanitaria extends StatelessWidget {
  final String nombreLote;
  const OpcionesFitosanitaria({super.key, required this.nombreLote});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Column(children: [
        _OpcionItem(
          ruta: '/lote/palmas',
          nombreLote: nombreLote,
          text: 'Ver palmas',
        ),
        const SizedBox(
          height: 15,
        ),
        _OpcionItem(
          ruta: '/lote/censo',
          nombreLote: nombreLote,
          text: 'Enfermedades',
        ),
        const SizedBox(
          height: 15,
        ),
        _OpcionItem(
            ruta: '/lote/aplicaciones', nombreLote: nombreLote, text: 'Plagas'),
        const SizedBox(
          height: 15,
        ),
        // _OpcionItem(
        //     ruta: '/lote/censo/registrarplaga',
        //     nombreLote: nombreLote,
        //     text: 'Registro de plagas'),
      ]),
    );
  }
}

class _OpcionItem extends StatelessWidget {
  final String text;
  final String ruta;
  final String nombreLote;

  const _OpcionItem({
    Key? key,
    required this.nombreLote,
    required this.text,
    required this.ruta,
  }) : super(key: key);

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
          color: Colors.white,
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
      ),
    );
  }
}

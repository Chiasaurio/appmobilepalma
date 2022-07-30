import 'package:apppalma/modules/Palma/PalmaDetail/registrospalma.dart';
import 'package:apppalma/modules/Tratamientos/cubit/tratamiento_cubit.dart';
import 'package:apppalma/modules/Tratamientos/ui/tratamiento/tratamiento_page.dart';
import 'package:apppalma/moor/tables/registroenfermedad_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class PalmasEnfermasList extends StatefulWidget {
  final String routeName;
  final List<PalmaConEnfermedad> palmasEnfermas;
  const PalmasEnfermasList(
      {Key? key, required this.routeName, required this.palmasEnfermas})
      : super(key: key);
  @override
  _PalmasEnfermasListState createState() => _PalmasEnfermasListState();
}

class _PalmasEnfermasListState extends State<PalmasEnfermasList> {
  late double width;
  late double height;
  late double altoCard;
  late double anchoCard;
  late double margin;
  List<PalmaConEnfermedad> palmas = [];
  PalmaConEnfermedad? palmaseleccionada;
  final f = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    palmas = widget.palmasEnfermas;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    altoCard = height * 0.4; //150,
    anchoCard = width;
    margin = anchoCard * 0.02;

    return buildPalmas();
  }

  //Titulo de la tabla
  Widget buildPalmas() {
    return Container(
        margin: EdgeInsets.all(margin),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Palmas enfermas",
                      style: TextStyle(
                          color: Colors.black87.withOpacity(0.8),
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    ),
                  ]),
              palmas.isNotEmpty
                  ? buildTabla()
                  : const Text('no hay palmas registradas para este lote'),
              SizedBox(height: margin),
            ]));
  }

  Widget buildTabla() {
    return Column(
        children: palmas.map((e) {
      return palmaTile(e);
    }).toList());
  }

  Widget palmaTile(PalmaConEnfermedad palma) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<TratamientoCubit>(context).obtenerProductos(palma);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const TratamientoPage()));
      },
      child: Card(
        elevation: 2.0,
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Fecha registro:',
                      style: TextStyle(fontSize: 16.0, color: Colors.grey)),
                  const Text('Linea:',
                      style: TextStyle(fontSize: 16.0, color: Colors.grey)),
                  const Text('Numero',
                      style: TextStyle(fontSize: 16.0, color: Colors.grey)),
                  const SizedBox(
                    width: 30,
                  ),
                  const Text('Enfermedad',
                      style: TextStyle(fontSize: 16.0, color: Colors.grey)),
                  const SizedBox(
                    width: 30,
                  ),
                  palma.etapa != null
                      ? const Text('Etapa',
                          style: TextStyle(fontSize: 16.0, color: Colors.grey))
                      : const SizedBox(),
                  const SizedBox(
                    width: 30,
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    f.format(palma.registroEnfermedad.fechaRegistro),
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    '${palma.palma.numerolinea}',
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    '${palma.palma.numeroenlinea}',
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    ' ${palma.enfermedad.nombreEnfermedad}',
                    style: const TextStyle(color: Colors.orange, fontSize: 18),
                    textAlign: TextAlign.start,
                  ),
                  palma.etapa != null
                      ? Text(
                          ' ${palma.etapa!.nombreEtapa}',
                          style: const TextStyle(
                              color: Colors.orange, fontSize: 18),
                          textAlign: TextAlign.start,
                        )
                      : const SizedBox()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget makeListaCensos(PalmaConEnfermedad palma) {
    return Card(
        elevation: 2.0,
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Padding(
          padding: EdgeInsets.fromLTRB(margin, margin, 0.0, margin),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(child: contenidoPalma(palma)),
              // TextButton(
              //   onPressed: () {
              //     censoseleccionado = censo;
              //     _opcionesBottomSheet(context);
              //   },
              //   child: const Icon(Icons.more_vert),
              // )
            ],
          ),
        ));
  }

  Widget contenidoPalma(PalmaConEnfermedad palma) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            const Text('Fecha registro:',
                style: TextStyle(fontSize: 16.0, color: Colors.grey)),
            Text(
              f.format(palma.registroEnfermedad.fechaRegistro),
              style: const TextStyle(color: Colors.black, fontSize: 18),
              textAlign: TextAlign.start,
            ),
          ],
        ),
        SizedBox(height: margin * 0.5),
        Row(
          children: <Widget>[
            const Text('Linea:',
                style: TextStyle(fontSize: 16.0, color: Colors.grey)),
            const SizedBox(
              width: 30,
            ),
            Text(
              '${palma.palma.numerolinea}',
              style: const TextStyle(color: Colors.black, fontSize: 18),
              textAlign: TextAlign.start,
            ),
          ],
        ),
        SizedBox(height: margin * 0.5),
        Row(
          children: <Widget>[
            const Text('Numero',
                style: TextStyle(fontSize: 16.0, color: Colors.grey)),
            const SizedBox(
              width: 30,
            ),
            Text(
              '${palma.palma.numeroenlinea}',
              style: const TextStyle(color: Colors.black, fontSize: 18),
              textAlign: TextAlign.start,
            ),
          ],
        ),
        Row(
          children: <Widget>[
            const Text('Enfermedad',
                style: TextStyle(fontSize: 16.0, color: Colors.grey)),
            Text(
              ' ${palma.enfermedad.nombreEnfermedad}',
              style: const TextStyle(color: Colors.orange, fontSize: 18),
              textAlign: TextAlign.start,
            ),
          ],
        ),
        palma.etapa != null
            ? Row(
                children: <Widget>[
                  const Text('Etapa',
                      style: TextStyle(fontSize: 16.0, color: Colors.grey)),
                  Text(
                    ' ${palma.enfermedad.nombreEnfermedad}',
                    style: const TextStyle(color: Colors.orange, fontSize: 18),
                    textAlign: TextAlign.start,
                  ),
                ],
              )
            : const SizedBox(),
      ],
    );
  }
}

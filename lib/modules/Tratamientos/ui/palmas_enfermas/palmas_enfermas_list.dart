import 'package:apppalma/modules/Palma/PalmaDetail/registrospalma.dart';
import 'package:apppalma/modules/Tratamientos/cubit/tratamiento_cubit.dart';
import 'package:apppalma/modules/Tratamientos/ui/tratamiento/tratamiento_form.dart';
import 'package:apppalma/modules/Tratamientos/ui/tratamiento/tratamiento_page.dart';
import 'package:apppalma/moor/tables/registroenfermedad_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Linea de palma: '),
                  const Text('Numero en linea: '),
                  const Text('Enfermedad: '),
                  palma.etapa != null ? const Text('Etapa: ') : const SizedBox()
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(palma.palma.numeroenlinea.toString()),
                  Text(palma.palma.numeroenlinea.toString()),
                  Text(palma.enfermedad.nombreEnfermedad),
                  palma.etapa != null
                      ? Text(palma.etapa!.nombreEtapa)
                      : const SizedBox()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

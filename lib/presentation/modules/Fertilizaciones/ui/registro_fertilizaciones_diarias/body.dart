import 'package:flutter/material.dart';
import 'package:apppalma/data/moor/moor_database.dart';
import 'package:intl/intl.dart';

class Body extends StatefulWidget {
  final List<FertilizacionDiariaData> fertilizacionesDiarias;
  const Body({Key? key, required this.fertilizacionesDiarias})
      : super(key: key);
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late double width;
  late double height;
  late double altoCard;
  late double anchoCard;
  Palma? palmaseleccionada;
  var formatter = DateFormat('yyyy-MM-dd hh:mm');
  late double margin;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    altoCard = height * 0.7; //150,
    anchoCard = width;
    margin = anchoCard * 0.04;
    return Flexible(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.fertilizacionesDiarias.length,
        itemBuilder: (context, index) {
          return fertilizacionDiariaTile(widget.fertilizacionesDiarias[index]);
        },
      ),
    );
    // ]));
  }

  Widget fertilizacionDiariaTile(FertilizacionDiariaData fertilizacionDiaria) {
    return GestureDetector(
      onTap: () {},
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
                  _rowText('Fecha fertilización',
                      formatter.format(fertilizacionDiaria.fecha)),
                  _rowText('Palmas fertilizadas',
                      fertilizacionDiaria.cantidadFertilizada.toString()),
                  _rowText('Linea inicio', fertilizacionDiaria.lineaInicio),
                  _rowText('Numero de palma inicio',
                      fertilizacionDiaria.numeroInicio),
                  _rowText('Orientación inicio',
                      fertilizacionDiaria.orientacionInicio),
                  _rowText('Linea fin', fertilizacionDiaria.lineaFin),
                  _rowText(
                      'Numero de palma fin', fertilizacionDiaria.numeroFin),
                  _rowText(
                      'Orientación fin', fertilizacionDiaria.orientacionFin),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _rowText(String title, String value) {
    return Row(
      children: [
        Text(
          '$title: ',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(value)
      ],
    );
  }

  onSelectedRow(bool selected, Palma palma) {
    setState(() {
      if (selected) {
        palmaseleccionada = palma;
      } else {
        palmaseleccionada = null;
      }
    });
  }
}

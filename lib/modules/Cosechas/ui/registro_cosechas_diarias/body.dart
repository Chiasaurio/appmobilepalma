import 'package:flutter/material.dart';
import 'package:apppalma/moor/moor_database.dart';
import 'package:intl/intl.dart';

class Body extends StatefulWidget {
  final List<CosechaDiariaData> cosechasDiarias;
  const Body({Key? key, required this.cosechasDiarias}) : super(key: key);
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
        itemCount: widget.cosechasDiarias.length,
        itemBuilder: (context, index) {
          return cosechaDiariaTile(widget.cosechasDiarias[index]);
        },
      ),
    );
    // ]));
  }

  Widget cosechaDiariaTile(CosechaDiariaData cosechaDiaria) {
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
                children: const [
                  Text('Fecha cosecha: '),
                  Text('Racimos: '),
                  Text('Kilos: '),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(formatter.format(cosechaDiaria.fechaIngreso)),
                  Text(cosechaDiaria.cantidadRacimos.toString()),
                  Text(cosechaDiaria.kilos.toString()),
                ],
              ),
            ],
          ),
        ),
      ),
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

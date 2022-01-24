import 'package:apppalma/modules/Palma/PalmaDetail/registrospalma.dart';
import 'package:apppalma/moor/moor_database.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  final List<Palma> palmas;
  const Body({Key? key, required this.palmas}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late double width;
  late double height;
  late double altoCard;
  late double anchoCard;
  Palma? palmaseleccionada;
  late double margin;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    altoCard = height * 0.7; //150,
    anchoCard = width;
    margin = anchoCard * 0.04;
    return SingleChildScrollView(
        child: Column(children: <Widget>[
      seleccionarPalmas(),
    ]));
  }

  //StreamBuilder que obtiene las palmas de PalmaBloc
  Widget seleccionarPalmas() {
    return buildPalmas();
  }

  //Titulo de la tabla
  Widget buildPalmas() {
    return Container(
        margin: EdgeInsets.all(margin),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Todas palmas registradas',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.black87.withOpacity(0.8),
                            fontSize: 25,
                            fontWeight: FontWeight.w600),
                      ),
                    ]),
              ]),
              widget.palmas.isNotEmpty
                  ? buildTabla()
                  : const Text('no hay palmas registradas para este lote'),
            ]));
  }

  Widget buildTabla() {
    return SizedBox(
      height: altoCard,
      child: ListView.builder(
        itemCount: widget.palmas.length,
        itemBuilder: (context, index) {
          return palmaTile(widget.palmas[index]);
        },
      ),
    );
  }

  Widget palmaTile(Palma palma) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PalmaDetalleScreen(palma: palma)));
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
                children: const [
                  Text('Linea de palma: '),
                  Text('Numero en linea: '),
                  Text('Estado de palma: '),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(palma.numerolinea.toString()),
                  Text(palma.numeroenlinea.toString()),
                  Text(palma.estadopalma),
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

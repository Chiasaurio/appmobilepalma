import 'package:apppalma/Palma/PalmaDetail/registrospalma.dart';
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
    altoCard = height * 0.5; //150,
    anchoCard = width;
    margin = anchoCard * 0.04;
    return SingleChildScrollView(
        child: Column(children: <Widget>[
      seleccionarPalmas(),
      _buildContinuar(context),
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
        child: Column(children: <Widget>[
          Container(
            margin: EdgeInsets.all(margin),
            width: anchoCard,
            padding: const EdgeInsets.fromLTRB(15.0, 10.0, 0, 10.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            'Todas palmas registradas',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.black87.withOpacity(0.8),
                                fontSize: 25,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ]),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: <Widget>[
                  //     Expanded(
                  //       child:Text('Tabla de todas las palmas leídas:',textAlign: TextAlign.start, style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                  //     ),
                  //   ]
                  // ),
                ]),
          ),
          Container(
              child: Column(children: <Widget>[
            widget.palmas != null
                ? buildTabla()
                : Text('no hay palmas registradas para este lote'),
            SizedBox(height: margin),
          ])),
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
  // title: ,
  //Construye la tabla de palmas con los valores de la List<Palma> palmas
  // Widget buildTabla() {
  //   return Container(
  //       height: altoCard,
  //       child: SingleChildScrollView(
  //         child: DataTable(
  //           columnSpacing: anchoCard * 0.1,
  //           showCheckboxColumn: true,
  //           sortColumnIndex: 0,
  //           columns: [
  //             DataColumn(
  //               label: Text("Linea",
  //                   style: TextStyle(
  //                     color: Colors.black,
  //                     fontSize: 16,
  //                   )),
  //             ),
  //             DataColumn(
  //               label: Text("Numero",
  //                   style: TextStyle(
  //                     color: Colors.black,
  //                     fontSize: 16,
  //                   )),
  //             ),
  //             DataColumn(
  //               label: Text("Estado",
  //                   style: TextStyle(
  //                     color: Colors.black,
  //                     fontSize: 16,
  //                   )),
  //             ),
  //           ],
  //           rows: widget.palmas!
  //               .map(
  //                 (palma) => DataRow(
  //                     selected: palmaseleccionada != null &&
  //                             palmaseleccionada!.id == palma.id
  //                         ? true
  //                         : false,
  //                     onSelectChanged: (b) {
  //                       setState(() {
  //                         palmaseleccionada = palma;
  //                       });
  //                     },
  //                     cells: [
  //                       DataCell(Center(
  //                         child: Text(palma.numerolinea.toString(),
  //                             style: TextStyle(
  //                               color: Colors.black,
  //                               fontSize: 16,
  //                             )),
  //                       )),
  //                       DataCell(Center(
  //                         child: Text(palma.numeroenlinea.toString(),
  //                             style: TextStyle(
  //                               color: Colors.black,
  //                               fontSize: 16,
  //                             )),
  //                       )),
  //                       DataCell(Center(
  //                         child: Text(palma.estadopalma,
  //                             style:
  //                                 TextStyle(color: Colors.black, fontSize: 16)),
  //                       )),
  //                     ]),
  //               )
  //               .toList(),
  //         ),
  //       ));
  // }

//Boton de continuar para llenar el formulario del tratamiento.
  Widget _buildContinuar(BuildContext context) {
    return ElevatedButton(
      child: const Text(
        'Continuar',
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
      onPressed: () {
        if (palmaseleccionada != null) {
          //    Navigator.push(
          // context,
          // MaterialPageRoute(
          //     builder: (context) => EnfermedadForm(
          //         palgaArgumentos: PalmaArguments(
          //             widget.nombreLote, lineapalma!, numeropalma!))));
          // }
          // Navigator.pushNamed(context, 'lote/palmas/estadopalma/registrospalma',
          //     arguments: palmaseleccionada);
        }
      },
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

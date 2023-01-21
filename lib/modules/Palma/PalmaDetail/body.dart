import 'package:apppalma/constants.dart';
import 'package:apppalma/modules/Palma/PalmaDetail/registrospalma.dart';
import 'package:apppalma/moor/moor_database.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  final PalmaConProcesos palmaConProcesos;

  const Body({Key? key, required this.palmaConProcesos}) : super(key: key);
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late Palma palma;
  late RegistroEnfermedadData? registroenfermedad;
  late RegistroTratamientoData? registrotratamiento;
  late Enfermedade? enfermedad;
  late Etapa? etapa;

  late String nombrelote;
  late String ruta;
  Map<String, Color> etiquetacolor = {
    EstadosPalma.sana: Colors.green,
    EstadosPalma.enTratamiento: Colors.orange,
    EstadosPalma.alta: Colors.green,
    EstadosPalma.pendientePorErradicar: Colors.red,
    EstadosPalma.pendientePorTratar: Colors.yellow,
  };

  late double width;
  late double height;
  late double altoCard;
  late double anchoCard;
  late double separacion;
  late double margin;

  @override
  void initState() {
    palma = widget.palmaConProcesos.palma;
    registroenfermedad = widget.palmaConProcesos.registroenfermedad;
    registrotratamiento = widget.palmaConProcesos.registrotratamiento;
    enfermedad = widget.palmaConProcesos.enfermedad;
    etapa = widget.palmaConProcesos.etapa;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    nombrelote = palma.nombreLote;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    altoCard = height * 0.5; //150,
    anchoCard = width * 0.9;
    margin = anchoCard * 0.04;

    return Container(
      margin: EdgeInsets.all(margin),
      child: detallesPalma(),
    );
  }

  Widget detallesPalma() {
    return crearContenido();
  }

  Widget crearContenido() {
    return Card(
        elevation: 2.0,
        // child: Container(
        //   width: anchoCard,
        //   height: altoCard,
        //   margin: EdgeInsets.symmetric(horizontal: 10.0),
        //   padding: EdgeInsets.symmetric(horizontal: 30),
        //   decoration: BoxDecoration(
        //       shape: BoxShape.rectangle,
        //       borderRadius: new BorderRadius.circular(10.0),
        //       color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 11),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text('Linea palma',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 16)),
              Text(
                palma.numerolinea.toString(),
                style: const TextStyle(color: Colors.black, fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const Text('Numero palma',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 16)),
              Text(
                palma.numeroenlinea.toString(),
                style: const TextStyle(color: Colors.black, fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20.0),
              const Text('Estado palma',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 16)),
              const SizedBox(height: 5.0),
              Row(
                children: <Widget>[
                  crearEtiqueta(),
                  Text(
                    palma.estadopalma,
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              detallesEnfermedad(),
              const SizedBox(height: 20),
              const Text('Tratamiento',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16 /*fontWeight: FontWeight.bold*/)),
              const SizedBox(height: 5.0),
              Row(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                // mainAxisAlignment: MainAxisAlignment.},
                children: <Widget>[
                  registrotratamiento != null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'id producto: ${registrotratamiento!.idProductoAgroquimico}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 18),
                            ),
                            Text(
                              'tipo control: ${registrotratamiento!.tipoControl}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 18),
                            ),
                          ],
                        )
                      : const Flexible(
                          child: Text(
                            'No hay un registro de tratamiento para \nesta palma',
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                        )
                ],
              ),
              const SizedBox(height: 15.0),
              const Text('Observaciones',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16 /*fontWeight: FontWeight.bold*/)),
              const SizedBox(height: 5.0),
              // Text(
              //   // registroenfermedad.ob,
              //   style: TextStyle(color: Colors.black, fontSize: 18),
              //   textAlign: TextAlign.center,
              // ),
            ],
          ),
        ));
  }

  Widget detallesEnfermedad() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text('Enfermedad',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.grey,
                fontSize: 16 /*fontWeight: FontWeight.bold*/)),
        const SizedBox(height: 5.0),
        Row(
          children: <Widget>[
            Text(
              enfermedad != null ? enfermedad!.nombreEnfermedad : 'asdasd',
              style: const TextStyle(color: Colors.black, fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        const SizedBox(height: 10.0),
        // SizedBox(height: altoCard*0.1),
        etapa != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text('Etapa',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16 /*fontWeight: FontWeight.bold*/)),
                  const SizedBox(height: 5.0),
                  Row(
                    children: <Widget>[
                      Text(
                        etapa!.nombreEtapa,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              )
            : const SizedBox(),
      ],
    );
  }

  Widget crearEtiqueta() {
    return Container(
      width: 18,
      height: 18,
      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 10, 0.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: etiquetacolor[palma.estadopalma],
      ),
    );
  }
}

import 'package:apppalma/presentation/components/widgets/header_gradient.dart';
import 'package:flutter/material.dart';

class AplicacionesPage extends StatefulWidget {
  final String routeName;

  const AplicacionesPage({Key? key, required this.routeName}) : super(key: key);
  @override
  State<AplicacionesPage> createState() => _AplicacionesPageState();
}

class _AplicacionesPageState extends State<AplicacionesPage> {
  late double height;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        // appBar: HeaderApp(ruta: widget.routeName),
        body: Column(
      children: [
        HeaderGradient(title: "Gestión de plagas", ruta: widget.routeName),
        Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 15.0),
                child: _buildMenu(context)),
          ],
        ),
      ],
    ));
  }

  Widget _buildMenu(context) {
    return Table(
      children: [
        TableRow(
          children: [
            _crearBotonRedondeado('Registrar plaga',
                '/lote/censo/registrarplaga', Icons.art_track, context),
          ],
        ),
        TableRow(
          children: [
            _crearBotonRedondeado(
                'Registrar fumigación',
                '/lote/aplicaciones/censospendientes',
                Icons.art_track,
                context),
          ],
        ),
      ],
    );
  }

  Widget _crearBotonRedondeado(
      String opcion, String ruta, IconData icon, BuildContext context) {
    return GestureDetector(
      child: Container(
          height: height * 0.09,
          margin: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(50.0)),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(opcion,
                    style:
                        const TextStyle(color: Colors.black, fontSize: 18.0)),
                const SizedBox(width: 30),
                const Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.black,
                  ),
                ),
              ])),
      onTap: () {
        Navigator.pushNamed(context, ruta);
      },
    );
  }
}

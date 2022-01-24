import 'package:apppalma/modules/Enfermedad/cubit/enfermedad_cubit.dart';
import 'package:apppalma/modules/LotesList/cubit/loteslist_cubit.dart';
import 'package:apppalma/components/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'sync_bloc.dart';

class SincronizacionPage extends StatefulWidget {
  @override
  _SincronizacionPageState createState() => _SincronizacionPageState();
}

class _SincronizacionPageState extends State<SincronizacionPage> {
  final DateTime fecha =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  SyncBloc syncBloc = new SyncBloc();

  late double width;
  late double height;
  late double altoCard;
  late double anchoCard;
  late double margin;
  late String ruta;
  bool cargandobool = false;
  String msg = 'Sincronizando';
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    ruta = '/sincronizar';
    altoCard = height * 0.6; //150,
    anchoCard = width * 0.7;
    margin = anchoCard * 0.04;
    // _cargapercentaje = 50.0;
    // loteBloc.obtenerTodosLotesWithProcesos();

    return Scaffold(
      appBar: AppBarWidget.getAppBar('Sincronizacion', ruta, context),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: altoCard * 0.1),
            buildTitulo(),
            _buildMenu(context), // _menu2()
          ],
        ),
      ),
    );
  }

  Widget buildTitulo() {
    return Container(
      margin: EdgeInsets.fromLTRB(margin, 30, margin, margin),
      child: Column(
        children: <Widget>[
          Row(children: const <Widget>[
            Expanded(
              child: Text(
                "Ultima sincronizacion :",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 10.0, 0.0, 0.0),
            child: Row(children: const <Widget>[
              Expanded(
                child: Text(
                  "fecha ultima actualizacion",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ]),
          ),
          // Padding(
          //   padding: EdgeInsets.fromLTRB(anchoCard * 0.3, margin, 0.0, 0.0),
          //   child: Text(DateFormat('yMMMMEEEEd', 'es').format(fecha),
          //       style: TextStyle(color: Colors.white, fontSize: 15)),
          // )
        ],
      ),
    );
  }

  Widget _buildMenu(context) {
    return Container(
        width: width * 0.8,
        child: Padding(
            padding: EdgeInsets.fromLTRB(0.0, altoCard * 0.2, 0.0, 0.0),
            child: Column(
              children: [
                cargandobool ? buildBarraCarga() : const SizedBox(),
                Text(
                  msg,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0, right: 0.0),
                  child: ElevatedButton(
                    child: const Text("Sincronizar"),
                    onPressed: () {
                      _sincrozinar();
                      // obtenerDatos.sincronizar();
                    },
                  ),
                )
              ],
            )));
  }

  buildBarraCarga() {
    return const CircularProgressIndicator(
        // semanticsLabel: estadosync,
        // value: _cargapercentaje,
        );
  }

  _sincrozinar() async {
    setState(() {
      msg = 'Agregando lotes';
    });
    final lotes = await syncBloc.insertarLotes();
    BlocProvider.of<LoteslistCubit>(context).addLotesFromServerToLocal(lotes);
    setState(() {
      msg = 'Agregando enfermedades';
    });
    final map = await syncBloc.insertarEnfermedades();
    BlocProvider.of<EnfermedadCubit>(context)
        .addEnfermedadyEtapasFromServerToLocal(map);
  }
}

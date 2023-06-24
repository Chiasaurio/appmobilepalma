import 'package:apppalma/presentation/components/widgets/drawer.dart';
import 'package:apppalma/presentation/modules/Enfermedad/cubit/enfermedad_cubit.dart';
import 'package:apppalma/presentation/modules/LotesList/cubit/loteslist_cubit.dart';
import 'package:apppalma/presentation/modules/Plagas/cubit/plagas_cubit.dart';
import 'package:apppalma/presentation/modules/Productos_Agroquimicos/cubit/agroquimicos_cubit.dart';
import 'package:apppalma/presentation/modules/Sync/card_de_ultima_sync.dart';
import 'package:apppalma/presentation/modules/Sync/cubit/bajar_info_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/widgets/header_gradient.dart';
import 'sync_bloc.dart';

class SincronizacionPage extends StatefulWidget {
  final bool? disableBack;
  final String routeName;
  const SincronizacionPage(
      {Key? key, this.disableBack, required this.routeName})
      : super(key: key);

  @override
  State<SincronizacionPage> createState() => _SincronizacionPageState();
}

class _SincronizacionPageState extends State<SincronizacionPage> {
  @override
  void initState() {
    BlocProvider.of<BajarInfoCubit>(context).getFechasUltimaActualizacion();
    super.initState();
  }

  final DateTime fecha =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  SyncBloc syncBloc = SyncBloc();

  late String ruta;
  bool cargandobool = false;
  String msg = 'Sincronizando';
  @override
  Widget build(BuildContext context) {
    ruta = '/sincronizar';

    // _cargapercentaje = 50.0;
    // loteBloc.obtenerTodosLotesWithProcesos();

    return Scaffold(
      drawer: const SideDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            HeaderGradient(
                title: "Sincronizar",
                ruta: widget.routeName,
                disableBack:
                    widget.disableBack != null ? widget.disableBack! : false,
                showDrawer: true),
            const CardUltimaSync(),
            Padding(
              padding: const EdgeInsets.only(left: 0, right: 0.0),
              child: ElevatedButton(
                child: const Text("Sincronizar"),
                onPressed: () {
                  BlocProvider.of<BajarInfoCubit>(context)
                      .bajarRegistrosDelServidor();

                  // _sincrozinar();
                  // obtenerDatos.sincronizar();
                },
              ),
            )
            // buildTitulo(),
            // // SizedBox(height: altoCard * 0.1),
            // _buildMenu(context), // _menu2()
          ],
        ),
      ),
    );
  }

  Widget buildTitulo() {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 30, 15, 15),
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
    final lotes = await syncBloc.getLotesRemote();
    if (!mounted) return;
    BlocProvider.of<LoteslistCubit>(context).addLotesFromServerToLocal(lotes);
    setState(() {
      msg = 'Agregando enfermedades';
    });
    final enfermedades = await syncBloc.getEnfermedadesConEtapasRemote();
    if (!mounted) return;
    BlocProvider.of<EnfermedadCubit>(context)
        .addEnfermedadyEtapasFromServerToLocal(enfermedades);
    setState(() {
      msg = 'Agregando plagas';
    });
    final plagas = await syncBloc.getPlagasRemote();
    if (!mounted) return;
    BlocProvider.of<PlagasCubit>(context)
        .addPlagayEtapasFromServerToLocal(plagas);
    setState(() {
      msg = 'Agregando agroquimicos';
    });
    final agroquimicos = await syncBloc.getAgroquimicosRemote();
    if (!mounted) return;
    BlocProvider.of<AgroquimicosCubit>(context)
        .addProductosFromServerToLocal(agroquimicos);
  }
}

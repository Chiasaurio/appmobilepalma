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
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

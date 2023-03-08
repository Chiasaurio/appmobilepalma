import 'package:apppalma/components/custom_appbar.dart';
import 'package:apppalma/modules/LoteDetail/cubit/lote_detail_cubit.dart';
import 'package:apppalma/modules/Plateos/cubit/plateos_cubit.dart';
import 'package:apppalma/modules/Plateos/ui/nuevo_plateo/nuevoplateo_view.dart';
import 'package:apppalma/modules/Plateos/ui/plateo_activo/plateoactivo_page.dart';
import 'package:apppalma/data/moor/moor_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlateoPage extends StatefulWidget {
  final String routeName;

  const PlateoPage({Key? key, required this.routeName}) : super(key: key);
  @override
  State<PlateoPage> createState() => _PlateoPageState();
}

class _PlateoPageState extends State<PlateoPage> {
  Plateo? plateo;
  late String nombreLote;
  late double width;
  late double height;
  late double altoCard;
  late double anchoCard;
  late double margin;
  late double separacion;

  @override
  void initState() {
    final state = BlocProvider.of<LoteDetailCubit>(context).state;
    if (state is LoteChoosed) {
      nombreLote = state.lote.lote.nombreLote;
    }
    BlocProvider.of<PlateosCubit>(context).obtenerPlateoActivo(nombreLote);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    altoCard = height * 0.3; //150,
    anchoCard = width;
    margin = anchoCard * 0.04;
    separacion = height * 0.025; //150,

    return Scaffold(
      body: Column(
        children: [
          HeaderApp(
            ruta: widget.routeName,
          ),
          crearContenido(),
        ],
      ),
    );
  }

  Widget crearContenido() {
    return SingleChildScrollView(
      child: BlocConsumer<PlateosCubit, PlateosStateLoaded>(
          listener: (context, state) {
        setState(() {
          plateo = state.plateo;
        });
      }, builder: (context, state) {
        if (state.isLoaded) {
          plateo = state.plateo;
          return plateo != null
              ? PlateoActivoVista(plateo: plateo!)
              : NuevoPlateoView(nombrelote: nombreLote);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}

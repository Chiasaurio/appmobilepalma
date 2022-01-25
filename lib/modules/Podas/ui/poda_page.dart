import 'package:apppalma/components/custom_appbar.dart';
import 'package:apppalma/modules/LoteDetail/cubit/lote_detail_cubit.dart';
import 'package:apppalma/modules/Podas/cubit/podas_cubit.dart';
import 'package:apppalma/modules/Podas/ui/poda_activa/podaactiva_page.dart';
import 'package:apppalma/moor/moor_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'nueva_poda/nuevapoda_page.dart';

class PodaPage extends StatefulWidget {
  final String routeName;

  const PodaPage({Key? key, required this.routeName}) : super(key: key);
  @override
  _PodaPageState createState() => _PodaPageState();
}

class _PodaPageState extends State<PodaPage> {
  Poda? poda;
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
      nombreLote = state.lote.nombreLote;
    }
    BlocProvider.of<PodasCubit>(context).obtenerPodaActiva(nombreLote);
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
      child: BlocConsumer<PodasCubit, PodasStateLoaded>(
          listener: (context, state) {
        setState(() {
          if (state is PodasStateLoaded) {
            poda = state.poda;
          }
        });
      }, builder: (context, state) {
        if (state.isLoaded) {
          poda = state.poda;
          return poda != null
              ? PodaActivaPage(poda: poda!)
              : NuevaPodaPage(nombrelote: nombreLote);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}

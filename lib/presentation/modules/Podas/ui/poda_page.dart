import 'package:apppalma/presentation/modules/LoteDetail/cubit/lote_detail_cubit.dart';
import 'package:apppalma/data/moor/moor_database.dart';
import 'package:apppalma/presentation/modules/Podas/cubit/podas_cubit.dart';
import 'package:apppalma/presentation/modules/Podas/ui/nueva_poda/nuevapoda_page.dart';
import 'package:apppalma/presentation/modules/Podas/ui/poda_activa/podaactiva_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../components/widgets/header_gradient.dart';

class PodaPage extends StatefulWidget {
  final String routeName;
  const PodaPage({Key? key, required this.routeName}) : super(key: key);
  @override
  State<PodaPage> createState() => _PodaPageState();
}

class _PodaPageState extends State<PodaPage> {
  late String nombreLote;
  late int totalPalmas;

  Poda? poda;
  @override
  void initState() {
    final state = BlocProvider.of<LoteDetailCubit>(context).state;
    if (state is LoteChoosed) {
      totalPalmas = state.lote.lote.numeropalmas;
      nombreLote = state.lote.lote.nombreLote;
    }
    BlocProvider.of<PodasCubit>(context).obtenerPodaActiva(nombreLote);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // HeaderApp(
          //   ruta: widget.routeName,
          // ),
          HeaderGradient(
            title: "Poda actual",
            ruta: "/lotes",
            disableBack: false,
          ),
          crearContenido(),
        ],
      ),
    );
  }

  Widget crearContenido() {
    return BlocBuilder<PodasCubit, PodasStateLoaded>(builder: (context, state) {
      if (state.isLoaded) {
        poda = state.poda;
        return state.poda != null
            ? PodaActivaPage(
                poda: poda!,
                totalPalmas: totalPalmas,
              )
            : NuevaPodaPage(nombrelote: nombreLote);
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}

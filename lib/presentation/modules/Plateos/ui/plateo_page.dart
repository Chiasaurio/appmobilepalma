import 'package:apppalma/presentation/modules/LoteDetail/cubit/lote_detail_cubit.dart';
import 'package:apppalma/data/moor/moor_database.dart';
import 'package:apppalma/presentation/modules/Plateos/cubit/plateos_cubit.dart';
import 'package:apppalma/presentation/modules/Plateos/ui/nuevo_plateo/nuevoplateo_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../components/widgets/header_gradient.dart';
import 'plateo_activo/plateoactivo_page.dart';

class PlateoPage extends StatefulWidget {
  final String routeName;
  const PlateoPage({Key? key, required this.routeName}) : super(key: key);
  @override
  State<PlateoPage> createState() => _PlateoPageState();
}

class _PlateoPageState extends State<PlateoPage> {
  late String nombreLote;
  late int totalPalmas;
  Plateo? plateo;
  @override
  void initState() {
    final state = BlocProvider.of<LoteDetailCubit>(context).state;
    if (state is LoteChoosed) {
      nombreLote = state.lote.lote.nombreLote;
      totalPalmas = state.lote.lote.numeropalmas;
    }
    BlocProvider.of<PlateosCubit>(context).obtenerPlateoActivo(nombreLote);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderGradient(
            title: "Plateo actual",
            ruta: "/lotes",
            disableBack: false,
          ),
          crearContenido(),
        ],
      ),
    );
  }

  Widget crearContenido() {
    return BlocBuilder<PlateosCubit, PlateosStateLoaded>(
        builder: (context, state) {
      if (state.isLoaded) {
        plateo = state.plateo;
        return plateo != null
            ? PlateoActivoVista(plateo: plateo!, totalPalmas: totalPalmas)
            : NuevaPlateoPage(nombrelote: nombreLote);
      } else {
        return const Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: CircularProgressIndicator(),
              ),
            ],
          ),
        );
      }
    });
  }
}

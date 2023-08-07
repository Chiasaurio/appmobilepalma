import 'package:apppalma/presentation/modules/Fertilizaciones/cubit/fertilizaciones_cubit.dart';
import 'package:apppalma/presentation/modules/LoteDetail/cubit/lote_detail_cubit.dart';
import 'package:apppalma/data/moor/moor_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../components/widgets/header_gradient.dart';
import 'fertilizacion_activa/fertilizacionactiva_page.dart';
import 'nueva_fertilizacion/nuevafertilizacion_view.dart';

class FertilizacionPage extends StatefulWidget {
  final String routeName;
  const FertilizacionPage({Key? key, required this.routeName})
      : super(key: key);
  @override
  State<FertilizacionPage> createState() => _FertilizacionPageState();
}

class _FertilizacionPageState extends State<FertilizacionPage> {
  late String nombreLote;
  late int totalPalmas;
  Fertilizacione? fertilizacion;
  @override
  void initState() {
    final state = BlocProvider.of<LoteDetailCubit>(context).state;
    if (state is LoteChoosed) {
      nombreLote = state.lote.lote.nombreLote;
      totalPalmas = state.lote.lote.numeropalmas;
    }
    BlocProvider.of<FertilizacionCubit>(context)
        .obtenerFertilizacionActiva(nombreLote);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderGradient(
            title: "Fertilización actual",
            ruta: "/lotes",
            disableBack: false,
          ),
          crearContenido(),
        ],
      ),
    );
  }

  Widget crearContenido() {
    return BlocBuilder<FertilizacionCubit, FertilizacionStateLoaded>(
        builder: (context, state) {
      if (state.isLoaded) {
        fertilizacion = state.fertilizacion;
        return fertilizacion != null
            ? FertilizacionActivaVista(
                fertilizacion: fertilizacion!, totalPalmas: totalPalmas)
            : NuevaFertilizacionPage(nombrelote: nombreLote);
      } else {
        return Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
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

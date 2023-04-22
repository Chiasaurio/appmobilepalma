import 'package:apppalma/presentation/modules/Cosechas/cubit/cosecha_cubit.dart';
import 'package:apppalma/presentation/modules/Cosechas/ui/nueva_cosecha/nuevacosecha_page.dart';
import 'package:apppalma/presentation/modules/LoteDetail/cubit/lote_detail_cubit.dart';
import 'package:apppalma/data/moor/moor_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../components/widgets/header_gradient.dart';
import 'cosecha_activa/cosechaactiva_page.dart';

class CosechaPage extends StatefulWidget {
  final String routeName;
  const CosechaPage({Key? key, required this.routeName}) : super(key: key);
  @override
  State<CosechaPage> createState() => _CosechaPageState();
}

class _CosechaPageState extends State<CosechaPage> {
  // Cosecha cosecha;
  late String nombreLote;
  Cosecha? cosecha;
  @override
  void initState() {
    final state = BlocProvider.of<LoteDetailCubit>(context).state;
    if (state is LoteChoosed) {
      nombreLote = state.lote.lote.nombreLote;
    }
    BlocProvider.of<CosechaCubit>(context).obtenerCosechaActiva(nombreLote);
    super.initState();
  }

  String cosechasregistradas = '0';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // HeaderApp(
          //   ruta: widget.routeName,
          // ),
          HeaderGradient(
            title: "Cosecha actual",
            ruta: "/lotes",
            disableBack: false,
          ),
          crearContenido(),
        ],
      ),
    );
  }

  Widget crearContenido() {
    return BlocBuilder<CosechaCubit, CosechaStateLoaded>(
        builder: (context, state) {
      if (state.isLoaded) {
        cosecha = state.cosecha;
        return state.cosecha != null
            ? CosechaActivaVista(cosecha: cosecha!)
            : NuevaCosechaPage(nombrelote: nombreLote);
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}

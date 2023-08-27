import 'package:apppalma/presentation/modules/Fumigaciones/cubit/fumigacion_cubit.dart';
import 'package:apppalma/presentation/modules/LoteDetail/cubit/lote_detail_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Censo/cubit/censos_cubit.dart';
import '../Fumigaciones/ui/censos_pendientes_list/censos_plaga_list.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late String nombreLote;

  @override
  void initState() {
    final state = BlocProvider.of<LoteDetailCubit>(context).state;
    if (state is LoteChoosed) {
      nombreLote = state.lote.lote.nombreLote;
    }
    BlocProvider.of<FumigacionCubit>(context).clear();
    BlocProvider.of<CensosCubit>(context).obtenerCensosPendientes(nombreLote);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CensosCubit, CensosState>(
      builder: (context, state) {
        if (state.censos != null) {
          return CensosPlagaList(censosPendientes: state.censos!);
        } else {
          return SliverFixedExtentList(
              delegate: SliverChildListDelegate([
                const Center(
                  child: CircularProgressIndicator(),
                )
              ]),
              itemExtent: 10.0);
        }
      },
    );
  }
}

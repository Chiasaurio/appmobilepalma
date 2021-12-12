import 'package:apppalma/LoteDetail/cubit/lote_detail_cubit.dart';
import 'package:apppalma/Palma/PalmasList/body.dart';
import 'package:apppalma/Palma/cubit/palma_cubit.dart';
import 'package:apppalma/components/appbar.dart';
import 'package:flutter/material.dart';

import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';

class PalmasList extends StatefulWidget {
  final String routeName;

  const PalmasList({Key? key, required this.routeName}) : super(key: key);
  @override
  _PalmasListState createState() => _PalmasListState();
}

class _PalmasListState extends State<PalmasList> {
  // final podaBloc = new PodasBloc();
  // final plateoBloc = new PlateosBloc();
  // final cosechaBloc = new CosechasBloc();
  late String nombreLote;
  @override
  void initState() {
    final state = BlocProvider.of<LoteDetailCubit>(context).state;
    if (state is LoteChoosed) {
      nombreLote = state.lote.nombreLote;
    }
    BlocProvider.of<PalmaCubit>(context).obtenerPalmasLote(nombreLote);
    super.initState();
  }

  String nombrelote = '';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PalmaCubit, PalmaState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBarWidget.getAppBar('', '', context),
            body: state is PalmasLoteLoaded
                ? Body(palmas: state.palmas)
                : const Center(
                    child: CircularProgressIndicator(),
                  ));
      },
    );
  }
}

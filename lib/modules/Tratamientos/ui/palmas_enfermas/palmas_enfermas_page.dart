import 'package:apppalma/components/custom_appbar.dart';
import 'package:apppalma/modules/LoteDetail/cubit/lote_detail_cubit.dart';
import 'package:apppalma/modules/Palma/cubit/palma_cubit.dart';
import 'package:apppalma/modules/Tratamientos/cubit/tratamiento_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'palmas_enfermas_list.dart';

class PalmasEnfermasPage extends StatefulWidget {
  final String routeName;

  const PalmasEnfermasPage({Key? key, required this.routeName})
      : super(key: key);

  @override
  State<PalmasEnfermasPage> createState() => _TratamientoPageState();
}

class _TratamientoPageState extends State<PalmasEnfermasPage> {
  late String nombreLote;
  @override
  void initState() {
    final state = BlocProvider.of<LoteDetailCubit>(context).state;
    if (state is LoteChoosed) {
      nombreLote = state.lote.lote.nombreLote;
    }
    BlocProvider.of<TratamientoCubit>(context)
        .obtenerPalmasEnfermas(nombreLote);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderApp(ruta: widget.routeName),
      body: BlocBuilder<TratamientoCubit, TratamientoState>(
        builder: (context, state) {
          if (state is PalmasEnfermasLoaded) {
            return PalmasEnfermasList(
              routeName: widget.routeName,
              palmasEnfermas: state.palmasEnfermas,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

import 'package:apppalma/data/moor/moor_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../LoteDetail/cubit/lote_detail_cubit.dart';
import '../cubit/palma_cubit.dart';
import 'components/palma_seleccionada_info.dart';

class PalmasLoteList extends StatefulWidget {
  const PalmasLoteList({Key? key}) : super(key: key);
  @override
  State<PalmasLoteList> createState() => _PalmasLoteListState();
}

class _PalmasLoteListState extends State<PalmasLoteList> {
  late String nombreLote;
  @override
  void initState() {
    final state = BlocProvider.of<LoteDetailCubit>(context).state;
    if (state is LoteChoosed) {
      nombreLote = state.lote.lote.nombreLote;
    }
    BlocProvider.of<PalmaCubit>(context).obtenerPalmasLote(nombreLote);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: BlocBuilder<PalmaCubit, PalmaState>(
      builder: (context, state) {
        if (state.palmaSeleccionada != null) {
          return PalmaSeleccionadaInfo(palma: state.palmaSeleccionada!);
        } else {
          return seleccionarPalmas();
        }
      },
    ));
  }

  //StreamBuilder que obtiene las palmas de PalmaBloc
  Widget seleccionarPalmas() {
    return BlocBuilder<PalmaCubit, PalmaState>(
      builder: (context, state) {
        if (state.palmas != null) {
          return buildPalmas(state.palmas!);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  //Titulo de la tabla
  Widget buildPalmas(List<Palma> palmas) {
    return SingleChildScrollView(
      child: Container(
          margin: const EdgeInsets.all(15),
          child: palmas.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Todas palmas registradas',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.black87.withOpacity(0.8),
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600),
                            ),
                          ]),
                      buildTabla(palmas)
                    ])
              : const Center(
                  child: Text('No hay palmas registradas para este lote'),
                )),
    );
  }

  Widget buildTabla(List<Palma> palmas) {
    return Column(
        children: palmas.map((e) {
      return palmaTile(e);
    }).toList());
  }

  Widget palmaTile(Palma palma) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<PalmaCubit>(context).palmaSeleccionadaChanged(palma);
        BlocProvider.of<PalmaCubit>(context).obtenerProcesosPalma(
            numeroLinea: palma.numerolinea,
            numeroPalma: palma.numeroenlinea,
            orientacion: palma.orientacion);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Linea de palma: '),
                  Text('Numero en linea: '),
                  Text('Estado de palma: '),
                ],
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(palma.numerolinea.toString()),
                    Text(palma.numeroenlinea.toString()),
                    Text(palma.estadopalma),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:apppalma/presentation/modules/Censo/ui/widgets/censos_list.dart';
import 'package:apppalma/presentation/modules/LoteDetail/cubit/lote_detail_cubit.dart';
import 'package:apppalma/presentation/modules/Tratamientos/cubit/tratamiento_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    BlocProvider.of<TratamientoCubit>(context)
        .obtenerPalmasEnfermas(nombreLote);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TratamientoCubit, TratamientoState>(
      builder: (context, state) {
        if (state.status == TratamientoStatus.loaded) {
          return CensosEnfermedadesList(
            palmasEnfermas: state.palmasEnfermas!,
          );
        } else {
          return SliverFixedExtentList(
              delegate: SliverChildListDelegate([
                const Center(
                  child: CircularProgressIndicator(),
                )
              ]),
              itemExtent: 30.0);
        }
      },
    );
  }
}

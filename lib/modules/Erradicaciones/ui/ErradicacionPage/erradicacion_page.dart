import 'package:apppalma/modules/Erradicaciones/cubit/erradicacion_cubit.dart';
import 'package:apppalma/modules/Erradicaciones/ui/ErradicacionPage/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../LoteDetail/cubit/lote_detail_cubit.dart';
import '../../../Palma/cubit/palma_cubit.dart';

class ErradicacionPage extends StatefulWidget {
  final String routeName;

  const ErradicacionPage(
      {Key? key, this.routeName = '/lote/aplicaciones/registrartratamiento'})
      : super(key: key);

  @override
  State<ErradicacionPage> createState() => _ErradicacionPageState();
}

class _ErradicacionPageState extends State<ErradicacionPage> {
  late String nombreLote;
  @override
  void initState() {
    BlocProvider.of<ErradicacionCubit>(context).resetState();
    final state = BlocProvider.of<LoteDetailCubit>(context).state;
    if (state is LoteChoosed) {
      nombreLote = state.lote.lote.nombreLote;
      BlocProvider.of<PalmaCubit>(context).obtenerPalmasLote(nombreLote);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            titleSpacing: 0.0,
            leading: Container(
              decoration: const BoxDecoration(shape: BoxShape.circle),
              margin: const EdgeInsets.only(left: 10),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                iconSize: 25,
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 25,
                ),
              ),
            ),
            leadingWidth: 50,
            backgroundColor: Colors.white,
            elevation: 0.0,
            title: const Text(
              "Erradicar palma",
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: Body(
            nombreLote: nombreLote,
          )),
    );
  }
}

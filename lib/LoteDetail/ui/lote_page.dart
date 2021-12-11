import 'package:apppalma/LoteDetail/ui/body.dart';
import 'package:apppalma/LoteDetail/cubit/lote_detail_cubit.dart';
import 'package:apppalma/components/appbar.dart';
import 'package:flutter/material.dart';

import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';

class LotePage extends StatefulWidget {
  final String routeName;

  const LotePage({Key? key, required this.routeName}) : super(key: key);
  @override
  _LotePageState createState() => _LotePageState();
}

class _LotePageState extends State<LotePage> {
  // final podaBloc = new PodasBloc();
  // final plateoBloc = new PlateosBloc();
  // final cosechaBloc = new CosechasBloc();

  var width;
  var height;
  var altoCard;
  var anchoCard;
  var margin;
  String nombrelote = '';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoteDetailCubit, LoteDetailState>(
      builder: (context, state) {
        return Scaffold(
            appBar: state is LoteChoosed
                ? AppBarWidget.getAppBar(
                    state.lote.nombreLote, widget.routeName, context)
                : AppBarWidget.getAppBar(nombrelote, widget.routeName, context),
            body: state is LoteChoosed
                ? const Body()
                : const Center(
                    child: CircularProgressIndicator(),
                  ));
      },
    );
  }
}

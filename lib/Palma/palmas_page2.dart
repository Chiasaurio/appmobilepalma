import 'package:apppalma/LoteDetail/ui/body.dart';
import 'package:apppalma/LoteDetail/cubit/lote_detail_cubit.dart';
import 'package:apppalma/Palma/cubit/palma_cubit.dart';
import 'package:apppalma/components/appbar.dart';
import 'package:flutter/material.dart';

import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';

class PalmasPage extends StatefulWidget {
  final String routeName;

  const PalmasPage({Key? key, required this.routeName}) : super(key: key);
  @override
  _PalmasPageState createState() => _PalmasPageState();
}

class _PalmasPageState extends State<PalmasPage> {
  // final podaBloc = new PodasBloc();
  // final plateoBloc = new PlateosBloc();
  // final cosechaBloc = new CosechasBloc();
  @override
  void initState() {
    super.initState();
  }

  var width;
  var height;
  var altoCard;
  var anchoCard;
  var margin;
  String nombrelote = '';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PalmaCubit, PalmaState>(
      builder: (context, state) {
        return Scaffold(
            body: Column(
          children: [
            const Body(),
          ],
        ));
      },
    );
  }
}

import 'package:apppalma/Censo/cubit/censos_cubit.dart';
import 'package:apppalma/Censo/ui/body.dart';
import 'package:apppalma/LoteDetail/cubit/lote_detail_cubit.dart';
import 'package:apppalma/components/appbar.dart';
import 'package:apppalma/moor/moor_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'dart:ui';

class CensoPage extends StatefulWidget {
  final String routeName;

  const CensoPage({Key? key, required this.routeName}) : super(key: key);

  @override
  _CensoPageState createState() => _CensoPageState();
}

class _CensoPageState extends State<CensoPage> {
  @override
  void initState() {
    BlocProvider.of<CensosCubit>(context).obtenerCensosFumigados();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoteDetailCubit, LoteDetailState>(
      builder: (context, state) {
        if (state is LoteChoosed) {
          return Scaffold(
              appBar: AppBarWidget.getAppBar(
                  state.lote.nombreLote, widget.routeName, context),
              body: const Body());
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

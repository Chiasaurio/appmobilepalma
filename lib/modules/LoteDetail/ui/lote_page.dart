import 'package:apppalma/modules/LoteDetail/ui/components/header_lote_widget.dart';
import 'package:apppalma/modules/LotesList/cubit/loteslist_cubit.dart';
import 'package:apppalma/moor/tables/lotes_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../size_config.dart';
import '../cubit/lote_detail_cubit.dart';
import 'body.dart';
import 'components/lote_information_widget.dart';

class LotePage extends StatefulWidget {
  final String routeName;
  final LoteWithProcesos lote;
  const LotePage({Key? key, required this.routeName, required this.lote})
      : super(key: key);

  @override
  State<LotePage> createState() => _LotePageState();
}

class _LotePageState extends State<LotePage> {
  late LoteWithProcesos _lote;
  @override
  void initState() {
    _lote = widget.lote;
    BlocProvider.of<LoteDetailCubit>(context).reoadLote(widget.lote.lote.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final paddingTop = SizeConfig.paddingTop;
    return BlocListener<LoteDetailCubit, LoteDetailState>(
      listener: (context, state) {
        if (state is LoteChoosed) {
          _lote = state.lote;
        }
        setState(() {});
        // TODO: implement listener
      },
      child: Scaffold(
        appBar: HeaderLote(
          height: 75 + paddingTop,
          routeName: widget.routeName,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              LoteLocalInformation(lote: _lote),
              Body(lote: _lote),
            ],
          ),
        ),
      ),
    );
  }
}

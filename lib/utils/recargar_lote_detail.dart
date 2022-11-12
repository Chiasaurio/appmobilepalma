import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../modules/LoteDetail/cubit/lote_detail_cubit.dart';
import '../modules/LotesList/cubit/loteslist_cubit.dart';

recargarLote(BuildContext context) {
  BlocProvider.of<LoteslistCubit>(context).obtenerTodosLotesWithProcesos();
  LoteDetailState singleLoteDetail =
      BlocProvider.of<LoteDetailCubit>(context).state;
  //Recargar lote
  if (singleLoteDetail is LoteChoosed) {
    BlocProvider.of<LoteDetailCubit>(context)
        .reoadLote(singleLoteDetail.lote.lote.id);
  }
}

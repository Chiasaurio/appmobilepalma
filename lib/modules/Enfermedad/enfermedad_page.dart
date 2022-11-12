import 'package:apppalma/modules/Enfermedad/cubit/enfermedad_cubit.dart';
import 'package:apppalma/modules/LoteDetail/cubit/lote_detail_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'palmaindividual_view.dart';

class EnfermedadPage extends StatefulWidget {
  final String routeName;

  const EnfermedadPage({Key? key, required this.routeName}) : super(key: key);
  @override
  _EnfermedadPageState createState() => _EnfermedadPageState();
}

class _EnfermedadPageState extends State<EnfermedadPage>
    with TickerProviderStateMixin {
  // TabController _tabController;
  late String nombreLote;
  @override
  void initState() {
    BlocProvider.of<EnfermedadCubit>(context)
        .obtenerTodasEnfermedadesConEtapas();
    final state = BlocProvider.of<LoteDetailCubit>(context).state;
    if (state is LoteChoosed) {
      nombreLote = state.lote.lote.nombreLote;
    }
    super.initState();
  }

  @override
  void dispose() {
    // _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              Text('ruta', style: TextStyle(fontSize: 12)),
              Text('nombrelote'),
            ]),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: PalmaIndividualView(
          nombreLote: nombreLote,
        ),
      ),
    );
  }
}

import 'package:apppalma/components/widgets/appbar_custom.dart';
import 'package:apppalma/modules/Enfermedad/cubit/enfermedad_cubit.dart';
import 'package:apppalma/modules/Enfermedad/ui/body.dart';
import 'package:apppalma/modules/LoteDetail/cubit/lote_detail_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EnfermedadPage extends StatefulWidget {
  final String routeName;

  const EnfermedadPage({Key? key, required this.routeName}) : super(key: key);
  @override
  State<EnfermedadPage> createState() => _EnfermedadPageState();
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
      BlocProvider.of<EnfermedadCubit>(context).initCubit(nombreLote);
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const WhiteAppBar(title: "Registrar enfermedad"),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Body(nombreLote: nombreLote),
        ),
      ),
    );
  }
}

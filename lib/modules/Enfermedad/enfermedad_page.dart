import 'package:apppalma/modules/Enfermedad/cubit/enfermedad_cubit.dart';
import 'package:apppalma/modules/Enfermedad/ui/body.dart';
import 'package:apppalma/modules/Enfermedad/ui/components/header_enfermedad.dart';
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

  final Color colorBlanco = Colors.white.withOpacity(0.7);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Stack(
            children: [
              HeaderEnfermedad(colorBlanco: colorBlanco),
              Column(
                children: [
                  SizedBox(height: 125 + MediaQuery.of(context).padding.top),
                  Body(nombreLote: nombreLote),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

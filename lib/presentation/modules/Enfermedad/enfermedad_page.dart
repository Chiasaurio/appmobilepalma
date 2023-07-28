import 'package:apppalma/presentation/components/widgets/header_gradient.dart';
import 'package:apppalma/presentation/modules/Enfermedad/cubit/enfermedad_cubit.dart';
import 'package:apppalma/presentation/modules/LoteDetail/cubit/lote_detail_cubit.dart';
import 'package:apppalma/utils/form_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ui/components/enfermedad_form.dart';

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
    return Scaffold(
        body: BlocConsumer<EnfermedadCubit, EnfermedadState>(
      listener: (context, state) {
        if (state.status == FormStatus.submissionSuccess) {
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(children: [
            HeaderGradient(
                title: "Registrar enfermedad",
                ruta: widget.routeName,
                onPop: () {}),
            if (state.enfermedades != null)
              EnfermedadForm(
                  enfermedades: state.enfermedades,
                  setState: () {
                    setState(() {});
                  })
          ]),
        );
      },
    ));
  }
}

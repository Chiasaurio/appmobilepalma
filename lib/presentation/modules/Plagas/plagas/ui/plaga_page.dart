import 'package:apppalma/presentation/modules/Censo/cubit/censos_cubit.dart';
import 'package:apppalma/presentation/modules/LoteDetail/cubit/lote_detail_cubit.dart';
import 'package:apppalma/presentation/modules/Plagas/cubit/plagas_cubit.dart';
import 'package:apppalma/presentation/modules/Plagas/plagas/ui/plaga_form.dart';
import 'package:apppalma/utils/form_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../components/widgets/header_gradient.dart';
import '../../../../constants.dart';

class PlagaPage extends StatefulWidget {
  final String routeName;

  const PlagaPage({Key? key, required this.routeName}) : super(key: key);

  @override
  State<PlagaPage> createState() => _PlagaPageState();
}

class _PlagaPageState extends State<PlagaPage> with TickerProviderStateMixin {
  late String nombreLote;
  @override
  void initState() {
    final state = BlocProvider.of<LoteDetailCubit>(context).state;
    if (state is LoteChoosed) {
      nombreLote = state.lote.lote.nombreLote;
    }
    BlocProvider.of<PlagasCubit>(context).clear(nombreLote);
    BlocProvider.of<PlagasCubit>(context).obtenerTodasPlagasConEtapas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<PlagasCubit, PlagasState>(
      listener: (context, state) {
        if (state.status == FormStatus.submissionSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: kSuccessColor,
              content: Text('Se registró el censo de plaga correctamente.'),
            ),
          );
          BlocProvider.of<CensosCubit>(context)
              .obtenerCensosPendientes(nombreLote);
          Navigator.of(context).pop();
        } else if (state.status == FormStatus.submissionFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: kRedColor,
              content: Text('Error realizando el registro.'),
            ),
          );
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(children: [
            HeaderGradient(
                title: "Registrar plaga", ruta: widget.routeName, onPop: () {}),
            if (state.plagas != null)
              PlagaForm(
                nombreLote: nombreLote,
                plagas: state.plagas!,
              )
          ]),
        );
      },
    ));
  }
}

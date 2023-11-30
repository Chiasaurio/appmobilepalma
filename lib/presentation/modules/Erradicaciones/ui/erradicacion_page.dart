import 'package:apppalma/presentation/components/widgets/sliver_app_bar.dart';
import 'package:apppalma/presentation/constants.dart';
import 'package:apppalma/presentation/modules/Erradicaciones/cubit/erradicacion_cubit.dart';
import 'package:apppalma/presentation/modules/Erradicaciones/ui/widgets/observaciones_campo.dart';
import 'package:apppalma/presentation/modules/Tratamientos/cubit/tratamiento_cubit.dart';
import 'package:apppalma/utils/form_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/card_palma_info.dart';
import 'widgets/submit_erradicacion_button.dart';

class ErradicacionPage extends StatelessWidget {
  const ErradicacionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ErradicacionCubit, ErradicacionConCausa>(
      listener: (context, state) {
        if (state.status == FormStatus.submissionSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: kSuccessColor,
              content: Text('Se registró la erradicación correctamente.'),
            ),
          );
          BlocProvider.of<TratamientoCubit>(context)
              .obtenerPalmasEnfermas(state.palma!.palma.nombreLote);
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
        return Scaffold(
            body: CustomScrollView(
          slivers: [
            SliverAppBarGradient(
              title: "Erradicar palma",
              ruta: "palma/erradicacion",
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              CardPalmaInfo(palma: state.palma!),
              const SizedBox(
                height: 10,
              ),
              const ObservacionesErradicacion(),
              const SizedBox(
                height: 20,
              ),
              const SubmitErradicacionButton()
            ]))
          ],
        ));
      },
    );
  }
}

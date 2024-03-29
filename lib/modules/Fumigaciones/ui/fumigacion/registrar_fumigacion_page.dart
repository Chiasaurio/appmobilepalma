import 'package:apppalma/modules/Censo/cubit/censos_cubit.dart';
import 'package:apppalma/modules/Fumigaciones/cubit/fumigacion_cubit.dart';
import 'package:apppalma/modules/Fumigaciones/ui/fumigacion/fumigacion_form.dart';
import 'package:apppalma/utils/form_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrarFumigacionPage extends StatefulWidget {
  final String routeName;
  const RegistrarFumigacionPage(
      {Key? key, this.routeName = '/lote/aplicaciones/registrartratamiento'})
      : super(key: key);

  @override
  State<RegistrarFumigacionPage> createState() =>
      _RegistrarFumigacionPageState();
}

class _RegistrarFumigacionPageState extends State<RegistrarFumigacionPage> {
  @override
  void initState() {
    final censoState = BlocProvider.of<CensosCubit>(context).state;
    if (censoState is CensoPendienteEscogido) {
      BlocProvider.of<FumigacionCubit>(context)
          .obtenerProductos(censoState.censo);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FumigacionCubit, FumigacionState>(
      listener: (context, state) {
        if (state.status == FormStatus.submissionSuccess) {
          BlocProvider.of<CensosCubit>(context).obtenerCensosPendientes();
        }
      },
      builder: (context, state) {
        if (state.productosLoaded) {
          return FumigacionForm(
              censo: state.censo!, productos: state.productos!);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      // ),
    );
  }
}

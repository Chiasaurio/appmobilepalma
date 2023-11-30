import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../components/widgets/header_gradient.dart';
import '../../cubit/fertilizaciones_cubit.dart';
import 'body.dart';

class RegistroFertilizacionesDiarias extends StatefulWidget {
  final String routeName;

  const RegistroFertilizacionesDiarias({Key? key, required this.routeName})
      : super(key: key);

  @override
  State<RegistroFertilizacionesDiarias> createState() =>
      _RegistroFertilizacionesDiariasState();
}

class _RegistroFertilizacionesDiariasState
    extends State<RegistroFertilizacionesDiarias> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FertilizacionCubit, FertilizacionStateLoaded>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              HeaderGradient(
                ruta: widget.routeName,
                title: 'Fertilizaciones diarias',
              ),
              Body(fertilizacionesDiarias: state.fertilizacionDarias!),
            ],
          ),
        );
      },
    );
  }
}

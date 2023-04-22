import 'package:apppalma/presentation/components/custom_appbar.dart';
import 'package:apppalma/presentation/modules/Podas/cubit/podas_cubit.dart';
import 'package:apppalma/presentation/modules/Podas/ui/registro_podas_diarias/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistroPodasDiarias extends StatefulWidget {
  final String routeName;

  const RegistroPodasDiarias({Key? key, required this.routeName})
      : super(key: key);

  @override
  State<RegistroPodasDiarias> createState() => _RegistroPodasDiariasState();
}

class _RegistroPodasDiariasState extends State<RegistroPodasDiarias> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PodasCubit, PodasStateLoaded>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              HeaderApp(ruta: widget.routeName),
              Body(podasDiarias: state.podasDiarias!),
            ],
          ),
        );
      },
    );
  }
}

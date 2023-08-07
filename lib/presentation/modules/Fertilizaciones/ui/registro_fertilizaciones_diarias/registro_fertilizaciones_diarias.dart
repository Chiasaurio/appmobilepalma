import 'package:apppalma/presentation/components/custom_appbar.dart';
import 'package:apppalma/presentation/modules/Plateos/cubit/plateos_cubit.dart';
import 'package:apppalma/presentation/modules/Plateos/ui/registro_plateos_diarios/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistroPlateosDiarios extends StatefulWidget {
  final String routeName;

  const RegistroPlateosDiarios({Key? key, required this.routeName})
      : super(key: key);
  @override
  State<RegistroPlateosDiarios> createState() => _RegistroPlateosDiariosState();
}

class _RegistroPlateosDiariosState extends State<RegistroPlateosDiarios> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlateosCubit, PlateosStateLoaded>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              HeaderApp(ruta: widget.routeName),
              Body(plateosDiarios: state.plateosDiarios!),
            ],
          ),
        );

        // if (state is LoteChoosed) {
        //   return Scaffold(
        //       body: Column(children: [
        //     HeaderApp(
        //       ruta: widget.routeName,
        //     ),
        //     const Body(),
        //   ]));
        // } else {
        //   return const Center(
        //     child: CircularProgressIndicator(),
        //   );
        // }
      },
    );
  }
}

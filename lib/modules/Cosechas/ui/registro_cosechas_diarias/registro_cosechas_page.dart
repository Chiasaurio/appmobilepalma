import 'package:apppalma/modules/Cosechas/cubit/cosecha_cubit.dart';
import 'package:apppalma/modules/Cosechas/ui/registro_cosechas_diarias/body.dart';
import 'package:apppalma/components/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistroCosechasDiarias extends StatefulWidget {
  final String routeName;

  const RegistroCosechasDiarias({Key? key, required this.routeName})
      : super(key: key);

  @override
  _RegistroCosechasDiariasState createState() =>
      _RegistroCosechasDiariasState();
}

class _RegistroCosechasDiariasState extends State<RegistroCosechasDiarias> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CosechaCubit, CosechaStateLoaded>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              HeaderApp(ruta: widget.routeName),
              Body(cosechasDiarias: state.cosechasDiarias!),
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

import 'package:apppalma/presentation/components/widgets/drawer.dart';
import 'package:apppalma/presentation/components/widgets/header_gradient.dart';
import 'package:apppalma/presentation/modules/Viajes/ui/primera_pagina/cubit/viajes_pendientes_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/body.dart';

class ViajesPendientesPage extends StatefulWidget {
  final String routeName;
  final bool? disableBack;

  const ViajesPendientesPage(
      {Key? key, required this.routeName, this.disableBack = false})
      : super(key: key);

  @override
  State<ViajesPendientesPage> createState() => _ViajesPendientesPageState();
}

class _ViajesPendientesPageState extends State<ViajesPendientesPage> {
  @override
  void initState() {
    BlocProvider.of<ViajesPendientesCubit>(context).getViajesPendientes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideDrawer(),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderGradient(
              title: "Viajes pendientes",
              ruta: widget.routeName,
              disableBack:
                  widget.disableBack != null ? widget.disableBack! : false,
              showDrawer: true),
          Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocBuilder<ViajesPendientesCubit, ViajesPendientesState>(
                      builder: (context, state) {
                    if (state.viajesPendientes != null &&
                        state.viajesPendientes!.isNotEmpty) {
                      return Body(viajesPendientes: state.viajesPendientes!);
                    } else {
                      return const Text('no hay viajes pendientes');
                    }
                  }),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/viajes/nuevoviaje');
                    },
                    icon: const Icon(Icons.add, size: 18),
                    label: const Text('Registrar nuevo viaje'),
                  )
                ],
              ))
        ],
      ),
    );
  }
}

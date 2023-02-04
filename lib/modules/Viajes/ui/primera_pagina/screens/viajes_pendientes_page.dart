import 'package:apppalma/components/main_button.dart';
import 'package:apppalma/modules/Viajes/ui/primera_pagina/cubit/viajes_pendientes_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../components/theme.dart';
import '../../../../../constants.dart';
import '../components/body.dart';

class ViajesPendientesPage extends StatefulWidget {
  final String routeName;

  const ViajesPendientesPage({Key? key, required this.routeName})
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
      appBar: AppBar(
        backgroundColor: AppPalmaColors.blue,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.routeName,
              style: const TextStyle(fontSize: 14),
            ),
            const Text(
              nombreFinca,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
      body: BlocBuilder<ViajesPendientesCubit, ViajesPendientesState>(
          builder: (context, state) {
        if (state.viajesPendientes != null &&
            state.viajesPendientes!.isNotEmpty) {
          return Body(viajesPendientes: state.viajesPendientes!);
        } else {
          return const Center(
            child: Text('no hay viajes pendientes'),
          );
        }
      }),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(15.0),
        child: MainButton(
            text: 'Registrar nuevo viaje',
            press: () {
              Navigator.of(context).pushNamed('/viajes/nuevoviaje');
            }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

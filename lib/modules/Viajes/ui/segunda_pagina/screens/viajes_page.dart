import 'package:apppalma/constants.dart';
import 'package:apppalma/modules/Viajes/cubit/viaje_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../components/theme.dart';
import '../components/body.dart';

class NuevoViajePage extends StatefulWidget {
  final String routeName;

  const NuevoViajePage({Key? key, required this.routeName}) : super(key: key);

  @override
  State<NuevoViajePage> createState() => _NuevoViajePageState();
}

class _NuevoViajePageState extends State<NuevoViajePage> {
  @override
  void initState() {
    BlocProvider.of<ViajeCubit>(context).initViajesState();
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
        body: const Body());
  }
}

import 'package:apppalma/presentation/modules/Viajes/cubit/viaje_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';

class TotalKilosWidget extends StatefulWidget {
  const TotalKilosWidget({Key? key}) : super(key: key);

  @override
  State<TotalKilosWidget> createState() => _TotalKilosWidgetState();
}

class _TotalKilosWidgetState extends State<TotalKilosWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViajeCubit, ViajeInitial>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: buildTotalKilos(state.totalKilos),
        );
      },
    );
  }

  Widget buildTotalKilos(num totalKilos) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
          color: kLightBlueColor, borderRadius: BorderRadius.circular(30)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Expanded(
            child: Text(
              'Total kilos : ',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
          Expanded(
            child: Text(
              '$totalKilos',
              style: const TextStyle(color: Colors.black, fontSize: 25),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

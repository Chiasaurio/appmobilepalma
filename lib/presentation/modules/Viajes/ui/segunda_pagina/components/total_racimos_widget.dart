import 'package:apppalma/presentation/constants.dart';
import 'package:apppalma/presentation/modules/Viajes/cubit/viaje_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TotalRacimosWidget extends StatefulWidget {
  const TotalRacimosWidget({Key? key}) : super(key: key);

  @override
  State<TotalRacimosWidget> createState() => _TotalRacimosWidgetState();
}

class _TotalRacimosWidgetState extends State<TotalRacimosWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViajeCubit, ViajeInitial>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: buildTotalRacimos(state.totalRacimos),
        );
      },
    );
  }

  Widget buildTotalRacimos(num totalRacimos) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
          color: kLightBlueColor, borderRadius: BorderRadius.circular(30)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Expanded(
            child: Text(
              'Total racimos : ',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
          Expanded(
            child: Text(
              '$totalRacimos',
              style: const TextStyle(color: Colors.black, fontSize: 25),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

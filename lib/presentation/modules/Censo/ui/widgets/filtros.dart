import 'package:apppalma/presentation/constants.dart';
import 'package:apppalma/presentation/modules/Censo/ui/widgets/persistent_sliver_header.dart';
import 'package:apppalma/presentation/modules/Tratamientos/cubit/tratamiento_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FiltrosEnfermedades extends StatelessWidget {
  final String nombreLote;
  const FiltrosEnfermedades({super.key, required this.nombreLote});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: MySliverPersistentHeaderDelegate(min: 40, max: 60,
          BlocBuilder<TratamientoCubit, TratamientoState>(
              builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => BlocProvider.of<TratamientoCubit>(context)
                    .obtenerPalmasEnfermas(nombreLote),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  height: 30,
                  decoration: BoxDecoration(
                      color: state.filtro == null || state.filtro == ''
                          ? Colors.white
                          : Colors.grey[300],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(0, 1),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(child: Text("Todas")),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () => BlocProvider.of<TratamientoCubit>(context)
                    .obtenerPalmasEnfermas(
                        nombreLote, EstadosPalma.pendientePorTratar),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  height: 30,
                  decoration: BoxDecoration(
                      color: state.filtro == EstadosPalma.pendientePorTratar
                          ? Colors.white
                          : Colors.grey[300],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(0, 1),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                      child: Text(EstadosPalma.pendientePorTratar)),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () => BlocProvider.of<TratamientoCubit>(context)
                    .obtenerPalmasEnfermas(
                        nombreLote, EstadosPalma.pendientePorErradicar),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  height: 30,
                  decoration: BoxDecoration(
                      color: state.filtro == EstadosPalma.pendientePorErradicar
                          ? Colors.white
                          : Colors.grey[300],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(0, 1),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(child: Text('Erradicacion')),
                ),
              ),
              // const SizedBox(
              //   width: 10,
              // ),
              //             GestureDetector(
              // onTap: () => BlocProvider.of<TratamientoCubit>(context)
              //       .obtenerPalmasEnfermas(
              //           nombreLote, EstadosPalma.pendientePorTratar),
              //   child: Container(
              //     height: 30,
              //     decoration: BoxDecoration(
              //         color: state.filtro == EstadosPalma.pendientePorTratar
              //             ? Colors.white
              //             : Colors.grey[300],
              //         boxShadow: [
              //           BoxShadow(
              //             color: Colors.grey.withOpacity(0.5),
              //             spreadRadius: 1,
              //             blurRadius: 1,
              //             offset: const Offset(0, 1),
              //           ),
              //         ],
              //         borderRadius: BorderRadius.circular(10)),
              //     child: const Center(
              //         child: Text(EstadosPalma.pendientePorTratar)),
              //   ),
              // ),
              // const SizedBox(
              //   width: 10,
              // ),
              // GestureDetector(
              //   onTap: () => BlocProvider.of<TratamientoCubit>(context)
              //       .obtenerPalmasEnfermas(
              //           nombreLote, EstadosPalma.pendientePorErradicar),
              //   child: Container(
              //     width: double.infinity,
              //     height: 30,
              //     decoration: BoxDecoration(
              //         color:
              //             state.filtro == EstadosPalma.pendientePorErradicar
              //                 ? Colors.white
              //                 : Colors.grey[300],
              //         boxShadow: [
              //           BoxShadow(
              //             color: Colors.grey.withOpacity(0.5),
              //             spreadRadius: 1,
              //             blurRadius: 1,
              //             offset: const Offset(0, 1),
              //           ),
              //         ],
              //         borderRadius: BorderRadius.circular(10)),
              //     child: const Center(
              //         child: Text(EstadosPalma.pendientePorErradicar)),
              //   ),
              // ),
            ],
          ),
        );
      })),
      pinned: false,
    );
  }
}

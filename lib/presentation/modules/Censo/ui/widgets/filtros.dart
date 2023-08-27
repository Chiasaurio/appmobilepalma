import 'package:apppalma/presentation/constants.dart';
import 'package:apppalma/presentation/modules/Censo/ui/widgets/persistent_sliver_header.dart';
import 'package:flutter/material.dart';

class FiltrosEnfermedades extends StatelessWidget {
  const FiltrosEnfermedades({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: MySliverPersistentHeaderDelegate(
        min: 40,
        max: 60,
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.blue[200],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 3,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                      child: Text(EstadosPalma.pendientePorTratar)),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.blue[200],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 3,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(child: Text(EstadosPalma.enTratamiento)),
                ),
              ),
            ],
          ),
        ),
      ),
      pinned: false,
    );
  }
}

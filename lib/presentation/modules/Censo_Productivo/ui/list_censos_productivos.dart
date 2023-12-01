import 'package:apppalma/presentation/modules/Censo_Productivo/cubit/censo_productivo_cubit.dart';
import 'package:apppalma/presentation/modules/Censo_Productivo/ui/agregar_censo_productivo_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../LoteDetail/cubit/lote_detail_cubit.dart';

class ListCensosProductivos extends StatefulWidget {
  const ListCensosProductivos({super.key});

  @override
  State<ListCensosProductivos> createState() => _ListCensosProductivosState();
}

class _ListCensosProductivosState extends State<ListCensosProductivos> {
  @override
  void initState() {
    super.initState();
    final nombreLote =
        (BlocProvider.of<LoteDetailCubit>(context).state as LoteChoosed)
            .lote
            .lote
            .nombreLote;
    BlocProvider.of<CensoProductivoCubit>(context)
        .getAllCensosProductvos(nombreLote);
  }

  var formatter = DateFormat('yyyy-MM-dd hh:mm');

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CensoProductivoCubit, CensoProductivoInitial>(
      builder: (context, state) {
        if (state.censos == null) {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state.censos!.isEmpty) {
          return const SliverToBoxAdapter(
            child: Center(
              child: Text('No hay censos productivos registrados'),
            ),
          );
        }
        return SliverList.builder(
          itemCount: state.censos!.length,
          itemBuilder: (context, index) {
            final censo = state.censos![index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _rowText(
                            'Fecha censo', formatter.format(censo.fechaCenso)),
                        _rowText('Palmas leidas',
                            censo.palmasLeidas?.toString() ?? '?'),
                        _rowText('Flores femeninas',
                            censo.floresFemeninas?.toString() ?? '?'),
                        _rowText('Flores masculinas',
                            censo.floresMasculinas?.toString() ?? '?'),
                        _rowText('Racimos verdes',
                            censo.racimosVerdes?.toString() ?? '?'),
                        _rowText('Racimos pintones',
                            censo.racimosPintones?.toString() ?? '?'),
                        _rowText('Racimos sobremaduros',
                            censo.racimosSobremaduros?.toString() ?? '?'),
                        _rowText('Racimos maduros',
                            censo.racimosMaduros?.toString() ?? '?'),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AgregarCensoProductivoPage(
                                              censo: censo,
                                              routeName:
                                                  '/lote/censoproductivo/editar')));
                            },
                            child: const Text("Editar")),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _rowText(String title, String value) {
    return Row(
      children: [
        Text(
          '$title: ',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(value)
      ],
    );
  }
}

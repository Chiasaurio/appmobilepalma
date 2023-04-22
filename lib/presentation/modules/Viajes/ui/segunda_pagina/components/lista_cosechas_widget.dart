import 'package:apppalma/data/moor/moor_database.dart';
import 'package:apppalma/presentation/modules/Cosechas/cubit/cosecha_cubit.dart';
import 'package:apppalma/presentation/modules/Viajes/cubit/viaje_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListaCosechas extends StatefulWidget {
  const ListaCosechas({Key? key}) : super(key: key);

  @override
  State<ListaCosechas> createState() => _ListaCosechasState();
}

class _ListaCosechasState extends State<ListaCosechas> {
  int totalkilos = 0;
  List<Cosecha>? cosechas;
  List<Cosecha> cosechasseleccionadas = [];
  void loadCosechasFinalizadas() async {
    cosechas = await BlocProvider.of<CosechaCubit>(context)
        .obtenerCosechasFinalizadas();
    setState(() {});
  }

  @override
  void initState() {
    loadCosechasFinalizadas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (cosechas != null) {
      return builmoft();
      // return Expanded(
      //   child: GridView.count(
      //     // Create a grid with 2 columns. If you change the scrollDirection to
      //     // horizontal, this produces 2 rows.
      //     crossAxisCount: 1,
      //     childAspectRatio: 8,
      //     // Generate 100 widgets that display their index in the List.
      //     children: List.generate(cosechas!.length, (index) {
      //       return Center(
      //         child: Text(
      //           'Item $index',
      //           style: Theme.of(context).textTheme.headlineSmall,
      //         ),
      //       );
      //     }),
      //   ),
      // );
    } else {
      return const Center(
        child: SingleChildScrollView(),
      );
    }
  }

  Widget builmoft() {
    return Column(children: <Widget>[
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const <Widget>[
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
            child: Text('Seleccione las cosechas del viaje',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18, /*fontWeight: FontWeight.bold*/
                )),
          ),
        ),
      ]),
      (cosechas != null && cosechas!.isNotEmpty)
          ? buildTabla()
          : const SizedBox(
              height: 100,
              child: Center(child: Text('no hay cosechas activas'))),
    ]);
  }

  Widget buildTabla() {
    return SizedBox(
        // color: Colors.red,
        child: SingleChildScrollView(
      child: DataTable(
        columnSpacing: 20,
        showCheckboxColumn: true,
        sortColumnIndex: 0,
        columns: const [
          DataColumn(
            label: Text("Lote",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                )),
          ),
          DataColumn(
            label: Text("Racimos",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                )),
          ),
          DataColumn(
            label: Text("Peso",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                )),
          ),
        ],
        rows: cosechas!
            .map(
              (cosecha) => DataRow(
                  selected: cosechasseleccionadas.indexWhere((element) {
                            return cosecha.id == element.id;
                          }) >=
                          0
                      ? true
                      : false,
                  onSelectChanged: (b) {
                    onSelectedRow(b!, cosecha);
                  },
                  cells: [
                    DataCell(Center(
                      child: Text(cosecha.nombreLote,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          )),
                    )),
                    DataCell(Center(
                      child: Text(cosecha.cantidadRacimos.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          )),
                    )),
                    DataCell(Center(
                      child: Text(cosecha.kilos.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          )),
                    )),
                  ]),
            )
            .toList(),
      ),
    ));
  }

  onSelectedRow(bool selected, Cosecha cosecha) {
    setState(() {
      if (selected) {
        cosechasseleccionadas.add(cosecha);
        totalkilos = totalkilos + cosecha.kilos;
        BlocProvider.of<ViajeCubit>(context).agregarCosechaAlViaje(cosecha);
      } else {
        cosechasseleccionadas.removeWhere((item) => item.id == cosecha.id);
        totalkilos = totalkilos - cosecha.kilos;
        BlocProvider.of<ViajeCubit>(context).eliminarCosechaDelViaje(cosecha);
      }
    });
  }
}

import 'package:apppalma/presentation/modules/Censo/cubit/censos_cubit.dart';
import 'package:apppalma/data/moor/moor_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CensosPlagaList extends StatefulWidget {
  // final Future<List<CensoData>> future;
  final List<CensoData> censosPendientes;
  const CensosPlagaList({Key? key, required this.censosPendientes})
      : super(key: key);

  @override
  State<CensosPlagaList> createState() => _CensosPlagaListState();
}

class _CensosPlagaListState extends State<CensosPlagaList> {
  late double width;
  late double height;
  late double altoCard;
  late double anchoCard;
  late double margin;
  final f = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    altoCard = height * 0.4; //150,
    anchoCard = width * 0.7;
    margin = anchoCard * 0.04;
    return BlocBuilder<CensosCubit, CensosState>(
      // future: BlocProvider.of<CensosCubit>(context).obtenerCensosPendientes(),
      builder: (context, state) {
        final List<CensoData> censos = widget.censosPendientes;
        return ListView.builder(
            shrinkWrap: true,
            itemCount: censos.length,
            itemBuilder: (BuildContext context, int index) {
              return makeListaCensos(censos[index]);
            });
        // } else {
        //   return const Center(child: CircularProgressIndicator());
        // }
      },
    );
  }

  Widget makeListaCensos(CensoData censo) {
    return GestureDetector(
      onTap: () {
        // BlocProvider.of<TratamientoCubit>(context).obtenerProductos(palma);
        // BlocProvider.of<FumigacionCubit>(context).obtenerProductos(censo);
        BlocProvider.of<CensosCubit>(context).censoPendienteEscogido(censo);
        // Navigator.pushNamed(context, '/lote/plagas/registrarfumigacion');
      },
      child: Card(
          elevation: 2.0,
          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Padding(
            padding: EdgeInsets.fromLTRB(margin, margin, 0.0, margin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                contenidoCenso(censo),
                // TextButton(
                //   onPressed: () {
                //     censoseleccionado = censo;
                //     _opcionesBottomSheet(context);
                //   },
                //   child: const Icon(Icons.more_vert),
                // )
              ],
            ),
          )),
    );
  }

  Widget contenidoCenso(CensoData censo) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            const Text('Fecha registro:',
                style: TextStyle(fontSize: 16.0, color: Colors.grey)),
            Text(
              f.format(censo.fechaCenso),
              style: const TextStyle(color: Colors.black, fontSize: 18),
              textAlign: TextAlign.start,
            ),
          ],
        ),
        SizedBox(height: margin * 0.5),
        Row(
          children: <Widget>[
            const Text('Plaga:',
                style: TextStyle(fontSize: 16.0, color: Colors.grey)),
            Text(
              ' ${censo.nombrePlaga}',
              style: const TextStyle(color: Colors.black, fontSize: 18),
              textAlign: TextAlign.start,
            ),
          ],
        ),
        SizedBox(height: margin * 0.5),
        Row(
          children: <Widget>[
            const Text('Sector',
                style: TextStyle(fontSize: 16.0, color: Colors.grey)),
            Text(
              ' ${censo.lineaLimite1} - ${censo.lineaLimite2}',
              style: const TextStyle(color: Colors.black, fontSize: 18),
              textAlign: TextAlign.start,
            ),
          ],
        ),
        Row(
          children: <Widget>[
            const Text('Estado',
                style: TextStyle(fontSize: 16.0, color: Colors.grey)),
            Text(
              ' ${censo.estadoPlaga}',
              style: const TextStyle(color: Colors.orange, fontSize: 18),
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ],
    );
  }
}

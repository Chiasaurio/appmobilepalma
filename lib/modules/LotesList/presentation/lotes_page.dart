import 'package:apppalma/components/widgets/header_gradient.dart';
import 'package:apppalma/data/moor/tables/lotes_table.dart';
import 'package:apppalma/modules/LoteDetail/cubit/lote_detail_cubit.dart';
import 'package:apppalma/modules/LotesList/cubit/loteslist_cubit.dart';
import 'package:apppalma/data/moor/moor_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../LoteDetail/ui/lote_page.dart';

class EscogerLotePage extends StatefulWidget {
  const EscogerLotePage({super.key});
  @override
  State<EscogerLotePage> createState() => _EscogerLotePageState();
}

class _EscogerLotePageState extends State<EscogerLotePage> {
  late List<LoteWithProcesos> loteswithprocesos;
  late Lote lote;
  late List<Lote> lotes;
  late double margin;
  late double anchoCard;
  late double altoCard;
  late double width;
  late double height;

  @override
  void initState() {
    BlocProvider.of<LoteslistCubit>(context).obtenerTodosLotesWithProcesos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    altoCard = height * 0.4; //150,
    anchoCard = width;
    margin = anchoCard * 0.02;
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Finca CampoAlegre'),
      // ),
      body: Column(
        children: [
          HeaderGradient(title: "Lista de lotes", ruta: "/lotes"),
          BlocBuilder<LoteslistCubit, LoteslistState>(
            builder: (context, state) {
              if (state is LotesListLoaded) {
                loteswithprocesos = state.lotes;
                return getLotes();
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget getLotes() {
    return dataBody(context);
  }

  Widget dataBody(BuildContext context) {
    return Expanded(
        child:
            //  GridView.count(
            //     shrinkWrap: true,
            //     primary: false,
            //     padding: const EdgeInsets.all(20),
            //     childAspectRatio: 5,
            //     crossAxisSpacing: 10,
            //     mainAxisSpacing: 10,
            //     crossAxisCount: 1,
            //     children: loteswithprocesos.map((e) => makeListaLotes(e)).toList()),
            ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                itemCount: loteswithprocesos.length,
                itemBuilder: (BuildContext context, int index) {
                  return makeListaLotes(loteswithprocesos[index]);
                }));
  }

  Widget makeListaLotes(LoteWithProcesos loteswithprocesos) {
    return Container(
        margin: const EdgeInsets.all(5),
        width: anchoCard,
        padding: const EdgeInsets.only(left: 15),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey[400]!,
                blurRadius: 5,
                offset: const Offset(0, 2))
          ],
        ),
        child: ExpansionTile(
            tilePadding: EdgeInsets.zero,
            key: PageStorageKey<Lote>(loteswithprocesos.lote),
            title: Text(
              loteswithprocesos.lote.nombreLote,
              style: const TextStyle(color: Colors.black, fontSize: 18),
              textAlign: TextAlign.start,
            ),
            children: <Widget>[
              buildContenidoLotes(loteswithprocesos),
            ]));
  }

  Widget buildContenidoLotes(LoteWithProcesos loteswithprocesos) {
    return Container(
        padding: EdgeInsets.fromLTRB(0, 0.0, margin, margin),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Avisos: ',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    const SizedBox(height: 5.0),
                    loteswithprocesos.cosecha != null
                        ? Row(children: [
                            Container(
                              width: 15.0,
                              height: 15.0,
                              decoration: const BoxDecoration(
                                color: Colors.orange,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: margin),
                            const Text(
                              'Cosecha pendiente ',
                              style: TextStyle(fontSize: 16),
                            ),
                          ])
                        : const SizedBox(),
                    loteswithprocesos.poda != null
                        ? Row(children: [
                            Container(
                              width: 15.0,
                              height: 15.0,
                              decoration: const BoxDecoration(
                                color: Colors.orange,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: margin),
                            const Text(
                              'Poda pendiente ',
                              style: TextStyle(fontSize: 16),
                            ),
                          ])
                        : const SizedBox(),
                    loteswithprocesos.plateo != null
                        ? Row(children: [
                            Container(
                              width: 15.0,
                              height: 15.0,
                              decoration: const BoxDecoration(
                                color: Colors.orange,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: margin),
                            const Text(
                              'Plateo pendiente ',
                              style: TextStyle(fontSize: 16),
                            ),
                          ])
                        : const SizedBox(),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 5),
            buildIngresarLote(loteswithprocesos),
          ],
        ));
  }

  Widget buildIngresarLote(LoteWithProcesos loteswithprocesos) {
    return GestureDetector(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 200),
        margin: EdgeInsets.fromLTRB(0.0, 00, margin, 10),
        height: 35.0,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          border: Border.all(
            color: Colors.blue,
            width: 1.0,
          ),
        ),
        child: const Center(
            child: Text(
          'Ingresar Lote',
          style: TextStyle(color: Colors.blue, fontSize: 20),
          textAlign: TextAlign.center,
        )),
      ),
      onTap: () {
        BlocProvider.of<LoteDetailCubit>(context)
            .loteEscogido(loteswithprocesos);
        // Navigator.pushNamed(context, '/lote');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                LotePage(routeName: '/lote', lote: loteswithprocesos),
          ),
        );
      },
    );
  }
}

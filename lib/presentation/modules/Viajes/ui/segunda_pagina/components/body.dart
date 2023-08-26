import 'package:apppalma/presentation/modules/Viajes/ui/segunda_pagina/components/total_racimos_widget.dart';
import 'package:flutter/material.dart';

import 'total_kilos_widget.dart';
import 'despachar_viaje_widget.dart';
import 'lista_cosechas_widget.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  DateTime fechaviaje =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  int totalkilos = 0;
  late double margin;
  late double anchoCard;
  late double altoCard;
  late double width;
  late double height;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    altoCard = height * 0.4; //150,
    anchoCard = width;
    margin = anchoCard * 0.02;
    return
        // SingleChildScrollView(
        //   child:
        //   Padding(
        // padding: const EdgeInsets.fromLTRB(0.0, 20, 0.0, 100),
        // child:
        const Expanded(
      child: Column(children: <Widget>[
        ListaCosechas(),
        TotalKilosWidget(),
        TotalRacimosWidget(),
        SizedBox(
          height: 50,
        ),
        DespacharViajeWidget()
      ]
          // ),
          // ),
          ),
    );
  }

//
}

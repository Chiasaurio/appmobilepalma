import 'package:apppalma/presentation/constants.dart';
import 'package:apppalma/presentation/modules/Palma/ui/lista_palmas_body.dart';
import 'package:apppalma/presentation/modules/Palma/cubit/palma_cubit.dart';
import 'package:apppalma/presentation/modules/Palma/ui/buscar_palma_body.dart';
import 'package:apppalma/presentation/modules/Palma/ui/components/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../LoteDetail/cubit/lote_detail_cubit.dart';

class PalmasPage extends StatefulWidget {
  const PalmasPage({super.key});

  @override
  State<PalmasPage> createState() => _PalmasPageState();
}

class _PalmasPageState extends State<PalmasPage> {
  late String nombreLote;
  late bool _leftTab;
  @override
  void initState() {
    final state = BlocProvider.of<LoteDetailCubit>(context).state;
    if (state is LoteChoosed) {
      nombreLote = state.lote.lote.nombreLote;
      BlocProvider.of<PalmaCubit>(context).initState(nombreLote);
    }
    _leftTab = true;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  setTab() {
    _leftTab = !_leftTab;
    setState(() {});
  }

  final Color colorBlanco = Colors.white.withOpacity(0.7);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: <Widget>[
          HeaderWave(leftTab: _leftTab),
          _buildHeader(),
          Positioned(
            top: 150 + MediaQuery.of(context).padding.top,
            left: 0,
            right: 0,
            bottom: 0,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  // const SizedBox(height: 100),
                  !_leftTab
                      ? BuscarPalmaBody(
                          nombreLote: nombreLote,
                        )
                      : const PalmasLoteList(),
                ],
              ),
            ),
          ),
          Positioned(
            top: 125,
            child: Row(
              children: [
                createTab(text: "Buscar palma", isLefTab: true),
                createTab(text: "Lista de palmas"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildHeader() {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).padding.top),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: FaIcon(FontAwesomeIcons.arrowLeft,
                    size: 25, color: Colors.white.withOpacity(0.7)),
              ),
              const SizedBox(width: 30),
              Text("Gestión de palmas",
                  style: TextStyle(
                      fontSize: 25,
                      color: colorBlanco,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ],
    );
  }

  GestureDetector createTab({required String text, bool isLefTab = false}) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<PalmaCubit>(context).initState(nombreLote);
        setTab();
      },
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          // color: _leftTab ? Colors.transparent : Colors.red
        ),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              color: _leftTab ^ isLefTab
                  // ? kPrimaryColor
                  ? kDefualtBlueColor
                  : Colors.white.withOpacity(0.3),
              fontSize: 16,
              fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}

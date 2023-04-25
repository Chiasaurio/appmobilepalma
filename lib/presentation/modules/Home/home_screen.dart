import 'package:apppalma/presentation/components/widgets/drawer.dart';
import 'package:apppalma/presentation/modules/Login/cubit/authentication_cubit.dart';
import 'package:apppalma/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../Login/resources/authentication_repository.dart';

class FincaPage extends StatefulWidget {
  const FincaPage({super.key});

  @override
  State<FincaPage> createState() => _FincaPageState();
}

class _FincaPageState extends State<FincaPage> {
  final DateTime fecha =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  double? margin;
  double? anchoCard;
  double? altoCard;
  double? width;
  double? height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    altoCard = height! * 0.4; //150,
    anchoCard = width;
    margin = anchoCard! * 0.02;
    SizeConfig().init(context);

    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) async {
        if (state.status == AuthenticationStatus.unauthenticated) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/auth-options', (_) => false);
        }
      },
      child: Scaffold(
        drawer: const SideDrawer(),
        body: Column(
          children: <Widget>[
            buildTitulo(),
            _buildMenu(context),
          ],
        ),
      ),
    );
  }

  Widget buildTitulo() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Expanded(
                  child: Text(
                    'Inicio',
                    style: TextStyle(color: Colors.black, fontSize: 35),
                  ),
                ),
                Builder(
                  builder: (BuildContext context) {
                    return IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      tooltip: MaterialLocalizations.of(context)
                          .openAppDrawerTooltip,
                    );
                  },
                ),
              ]),
          Text(DateFormat('yMMMMEEEEd', 'es').format(fecha),
              style: const TextStyle(color: Colors.black, fontSize: 15)),
        ],
      ),
    );
  }

  Widget _buildMenu(context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              _crearBotonRedondeado2(
                  'Ver lotes', '/lotes', FontAwesomeIcons.map, context),
              _crearBotonRedondeado2('Pluviometro', '/pluviometro',
                  FontAwesomeIcons.cloudRain, context),
              _crearBotonRedondeado2('Viajes de fruto', '/viajes',
                  FontAwesomeIcons.truck, context),
              _crearBotonRedondeado2('Sincronizar', '/sincronizar',
                  FontAwesomeIcons.rotate, context),
              _crearBotonRedondeado2('Subir a la nube', '/sinctoserver',
                  FontAwesomeIcons.cloudArrowUp, context),
            ],
          ),
        ));
  }

  Widget _crearBotonRedondeado2(
      String opcion, String ruta, IconData icon, BuildContext context) {
    return GestureDetector(
      child: Container(
          height: height! * 0.09,
          margin: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: const Color(0xFF95D5B2),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: const [
                BoxShadow(
                    color: Colors.grey, blurRadius: 2, offset: Offset(0, 1))
              ]),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 0.0),
                      child: Icon(
                        icon,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 30),
                    Text(opcion,
                        style: const TextStyle(
                            color: Colors.black, fontSize: 18.0)),
                  ],
                ),
                const Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.black,
                ),
              ])),
      onTap: () {
        Navigator.pushNamed(context, ruta);
      },
    );
  }
}

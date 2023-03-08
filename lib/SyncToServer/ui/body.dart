import 'package:apppalma/SyncToServer/ui/subir_a_la_nube_button.dart';
import 'package:flutter/material.dart';

import 'card_de_pendientes.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    // return BlocBuilder<SyncToServerCubit, SyncToServerState>(
    //   builder: (context, state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: Column(
        children: const [
          SizedBox(
            height: 20,
          ),
          Text("Registros por sincronizar"),
          CardPendientes(),
          SizedBox(
            height: 20,
          ),
          SubirALaNubeButton(),
        ],
      ),
    );
    //   },
    // );
  }
}

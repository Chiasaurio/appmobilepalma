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
    return Column(
      children: const [
        CardPendientes(),
      ],
    );
    //   },
    // );
  }
}

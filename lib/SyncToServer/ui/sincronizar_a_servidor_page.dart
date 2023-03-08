import 'package:apppalma/SyncToServer/cubit/sync_to_server_cubit.dart';
import 'package:apppalma/SyncToServer/ui/body.dart';
import 'package:apppalma/components/widgets/header_gradient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SyncToServerPage extends StatefulWidget {
  final String routeName;
  const SyncToServerPage({Key? key, required this.routeName}) : super(key: key);

  @override
  State<SyncToServerPage> createState() => _SyncToServerPageState();
}

class _SyncToServerPageState extends State<SyncToServerPage> {
  @override
  void initState() {
    BlocProvider.of<SyncToServerCubit>(context).getRegistrosPendientes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: AppPalmaColors.blue,
      //   title: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Text(
      //         widget.routeName,
      //         style: const TextStyle(fontSize: 14),
      //       ),
      //       const Text(
      //         nombreFinca,
      //         style: TextStyle(fontSize: 14),
      //       ),
      //     ],
      //   ),
      // ),
      body: Column(
        children: [
          HeaderGradient(title: "Subir a la nube", ruta: "/nube"),
          BlocBuilder<SyncToServerCubit, SyncToServerState>(
            builder: (context, state) {
              if (state.loaded) {
                return const Body();
              } else {
                return const Text('loading pendientes');
              }
            },
          ),
        ],
      ),
    );
  }
}

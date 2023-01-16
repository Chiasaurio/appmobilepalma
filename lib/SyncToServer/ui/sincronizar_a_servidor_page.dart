import 'package:apppalma/SyncToServer/cubit/sync_to_server_cubit.dart';
import 'package:apppalma/SyncToServer/ui/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/theme.dart';
import '../../constants.dart';

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
      appBar: AppBar(
        backgroundColor: AppPalmaColors.blue,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.routeName,
              style: const TextStyle(fontSize: 14),
            ),
            Text(
              nombreFinca,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
      body: BlocBuilder<SyncToServerCubit, SyncToServerState>(
        builder: (context, state) {
          if (state.loaded) {
            return const Body();
          } else {
            return const Text('loading pendientes');
          }
        },
      ),
    );
  }
}

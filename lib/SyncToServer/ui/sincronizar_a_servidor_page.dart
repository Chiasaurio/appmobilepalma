import 'package:apppalma/SyncToServer/cubit/sync_to_server_cubit.dart';
import 'package:apppalma/presentation/components/widgets/drawer.dart';
import 'package:apppalma/presentation/components/widgets/sliver_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'body.dart';

class SyncToServerPage extends StatefulWidget {
  final String routeName;
  final bool? disableBack;
  const SyncToServerPage(
      {super.key, required this.routeName, this.disableBack});

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
      drawer: const SideDrawer(),
      body: BlocBuilder<SyncToServerCubit, SyncToServerState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              SliverAppBarGradient(
                title: "Subir a la nube",
                ruta: "/nube",
                disableBack:
                    widget.disableBack != null ? widget.disableBack! : false,
              ),
              if (state.loaded) const Body()
            ],
          );
        },
      ),
      // body: Column(
      //   children: [
      //     HeaderGradient(
      // title: "Subir a la nube",
      // ruta: "/nube",
      // disableBack:
      //     widget.disableBack != null ? widget.disableBack! : false,
      //         showDrawer: true),
      //     BlocBuilder<SyncToServerCubit, SyncToServerState>(
      //       builder: (context, state) {
      //         if (state.loaded) {
      //           return const Body();
      //         } else {
      //           return const Text('loading pendientes');
      //         }
      //       },
      //     ),
      //   ],
      // ),
    );
  }
}

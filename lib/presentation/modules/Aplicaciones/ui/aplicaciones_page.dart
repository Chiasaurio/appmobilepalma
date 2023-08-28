import 'package:apppalma/presentation/components/widgets/sliver_app_bar.dart';
import 'package:apppalma/presentation/modules/Aplicaciones/ui/widgets/filtros.dart';
import 'package:apppalma/presentation/modules/LoteDetail/cubit/lote_detail_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'body.dart';

class AplicacionesPage extends StatelessWidget {
  final String routeName;

  const AplicacionesPage({Key? key, required this.routeName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoteDetailCubit, LoteDetailState>(
      builder: (context, state) {
        if (state is LoteChoosed) {
          return Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverAppBarGradient(
                  title: "Gestión de plagas",
                  ruta: routeName,
                ),
                FiltrosPlagas(nombreLote: state.lote.lote.nombreLote),
                // const FiltrosEnfermedades(),
                const Body()
              ],
            ),
            floatingActionButton: FloatingActionButton.extended(
              backgroundColor: Colors.green,
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/lote/censo/registrarplaga',
                );
              },
              label: const Row(
                children: [
                  Icon(Icons.add),
                  Text(
                    'Registrar censo',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const Scaffold(
              body: Center(
            child: CircularProgressIndicator(),
          ));
        }
      },
    );
  }
}

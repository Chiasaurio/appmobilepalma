import 'package:apppalma/presentation/components/widgets/sliver_app_bar.dart';
import 'package:apppalma/presentation/modules/Censo/ui/widgets/filtros.dart';
import 'package:apppalma/presentation/modules/LoteDetail/cubit/lote_detail_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './body.dart';

class CensoPage extends StatelessWidget {
  final String routeName;

  const CensoPage({Key? key, required this.routeName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoteDetailCubit, LoteDetailState>(
      builder: (context, state) {
        if (state is LoteChoosed) {
          return Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverAppBarGradient(
                  title: "Gestión de enfermedades",
                  ruta: routeName,
                ),
                FiltrosEnfermedades(nombreLote: state.lote.lote.nombreLote),
                const Body(),
                SliverList(
                    delegate: SliverChildListDelegate([
                  const SizedBox(
                    height: 50,
                  )
                ]))
              ],
            ),
            floatingActionButton: FloatingActionButton.extended(
              backgroundColor: Colors.green,
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/lote/censo/enfermedad',
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

import 'package:apppalma/components/custom_appbar.dart';
import 'package:apppalma/modules/LoteDetail/cubit/lote_detail_cubit.dart';
import 'package:apppalma/modules/Plagas/cubit/plagas_cubit.dart';
import 'package:apppalma/modules/Plagas/plagas/ui/plaga_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlagaPage extends StatefulWidget {
  final String routeName;

  const PlagaPage({Key? key, required this.routeName}) : super(key: key);
  @override
  _PlagaPageState createState() => _PlagaPageState();
}

class _PlagaPageState extends State<PlagaPage> with TickerProviderStateMixin {
  late String nombreLote;
  @override
  void initState() {
    BlocProvider.of<PlagasCubit>(context).obtenerTodasPlagasConEtapas();
    final state = BlocProvider.of<LoteDetailCubit>(context).state;
    if (state is LoteChoosed) {
      nombreLote = state.lote.lote.nombreLote;
    }
    super.initState();
  }

  @override
  void dispose() {
    // _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderApp(
        ruta: widget.routeName,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: PlagaForm(nombreLote: nombreLote),
            ),
          ],
        ),
      ),
    );
  }
}

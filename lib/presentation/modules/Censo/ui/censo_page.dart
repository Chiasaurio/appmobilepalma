import 'package:apppalma/presentation/modules/Censo/ui/body.dart';
import 'package:apppalma/presentation/modules/LoteDetail/cubit/lote_detail_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/widgets/header_gradient.dart';

class CensoPage extends StatefulWidget {
  final String routeName;

  const CensoPage({Key? key, required this.routeName}) : super(key: key);
  @override
  State<CensoPage> createState() => _CensoPageState();
}

class _CensoPageState extends State<CensoPage> {
  @override
  void initState() {
    // BlocProvider.of<CensosCubit>(context).obtenerCensosFumigados();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoteDetailCubit, LoteDetailState>(
      builder: (context, state) {
        if (state is LoteChoosed) {
          return Scaffold(
              body: Column(children: [
            // HeaderApp(
            //   ruta: widget.routeName,
            // ),
            HeaderGradient(
              title: "Opciónes de censo",
              ruta: widget.routeName,
            ),
            const Body(),
          ]));
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

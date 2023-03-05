import 'package:apppalma/modules/Fumigaciones/cubit/fumigacion_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../components/widgets/header_gradient.dart';
import '../../../Censo/cubit/censos_cubit.dart';
import '../fumigacion/registrar_fumigacion_page.dart';
import 'censos_plaga_list.dart';

class CensosPendientesPage extends StatefulWidget {
  final String routeName;

  const CensosPendientesPage({Key? key, required this.routeName})
      : super(key: key);

  @override
  State<CensosPendientesPage> createState() => _CensosPendientesPageState();
}

class _CensosPendientesPageState extends State<CensosPendientesPage> {
  late String nombreLote;
  @override
  void initState() {
    BlocProvider.of<FumigacionCubit>(context).clear();
    BlocProvider.of<CensosCubit>(context).obtenerCensosPendientes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            HeaderGradient(
              title: "Lista de censos",
              ruta: widget.routeName,
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height,
                child: BlocBuilder<CensosCubit, CensosState>(
                    builder: (context, state) {
                  if (state.censos != null && state.censo == null) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 15.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Lista de censos pendientes",
                                  style: TextStyle(
                                      color: Colors.black87.withOpacity(0.8),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 20),
                          CensosPlagaList(
                            censosPendientes: state.censos!,
                          ),
                        ],
                      ),
                    );
                  } else if (state.censo != null) {
                    return const Padding(
                      padding: EdgeInsets.only(bottom: 120.0),
                      child: RegistrarFumigacionPage(),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }))
          ],
        ),
      ),
    );
  }
}

import 'package:apppalma/components/custom_appbar.dart';
import 'package:apppalma/modules/Censo/cubit/censos_cubit.dart';
import 'package:apppalma/modules/Fumigaciones/cubit/fumigacion_cubit.dart';
import 'package:apppalma/modules/Fumigaciones/ui/censos_pendientes_list/censos_plaga_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:apppalma/modules/Fumigaciones/ui/fumigacion/fumigacion_form.dart';

import '../fumigacion/registrar_fumigacion_page.dart';

class CensosPendientesPage extends StatefulWidget {
  final String routeName;

  const CensosPendientesPage({Key? key, required this.routeName})
      : super(key: key);

  @override
  State<CensosPendientesPage> createState() => _CensosPendientesPageState();
}

class _CensosPendientesPageState extends State<CensosPendientesPage> {
  @override
  void initState() {
    BlocProvider.of<CensosCubit>(context).obtenerCensosPendientes();
    super.initState();
  }

  late double width;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: HeaderApp(
        ruta: widget.routeName,
      ),
      body: BlocBuilder<CensosCubit, CensosState>(builder: (context, state) {
        if (state is CensosListLoaded) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Lista de censos pendientes",
                        style: TextStyle(
                            color: Colors.black87.withOpacity(0.8),
                            fontSize: 25,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                CensosPlagaList(
                  censosPendientes: state.censos,
                ),
                const Divider(
                  color: Colors.black,
                ),
              ],
            ),
          );
        } else if (state is CensoPendienteEscogido) {
          // return FumigacionForm(censo: state.censo, productos: state.productos);
          return const RegistrarFumigacionPage();
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }),
    );
  }
}

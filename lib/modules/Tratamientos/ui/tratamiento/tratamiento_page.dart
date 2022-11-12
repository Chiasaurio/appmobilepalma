import 'package:apppalma/components/custom_appbar.dart';
import 'package:apppalma/modules/LoteDetail/cubit/lote_detail_cubit.dart';
import 'package:apppalma/modules/Tratamientos/cubit/tratamiento_cubit.dart';
import 'package:apppalma/modules/Tratamientos/ui/tratamiento/tratamiento_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TratamientoPage extends StatefulWidget {
  final String routeName;
  const TratamientoPage(
      {Key? key, this.routeName = '/lote/aplicaciones/registrartratamiento'})
      : super(key: key);

  @override
  State<TratamientoPage> createState() => _TratamientoPageState();
}

class _TratamientoPageState extends State<TratamientoPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        String nombreLote = '';
        final state = BlocProvider.of<LoteDetailCubit>(context).state;
        if (state is LoteChoosed) {
          nombreLote = state.lote.lote.nombreLote;
        }
        BlocProvider.of<TratamientoCubit>(context)
            .obtenerPalmasEnfermas(nombreLote);
        return true;
      },
      child: Scaffold(
        appBar: HeaderApp(ruta: widget.routeName),
        body: BlocBuilder<TratamientoCubit, TratamientoState>(
          builder: (context, state) {
            if (state is PalmaEnfermaEscogida) {
              return TratamientoForm(
                  palmaConEnfermedad: state.palmaEnferma,
                  productos: state.productos);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

import 'package:apppalma/presentation/modules/LoteDetail/cubit/lote_detail_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/moor/moor_database.dart';
import '../../../components/widgets/fecha.dart';
import '../../../components/widgets/sliver_app_bar.dart';
import '../../../constants.dart';
import '../cubit/censo_productivo_cubit.dart';

class AgregarCensoProductivoPage extends StatefulWidget {
  final String routeName;
  final CensoProductivoData? censo;
  const AgregarCensoProductivoPage(
      {super.key, required this.routeName, this.censo});

  @override
  State<AgregarCensoProductivoPage> createState() =>
      _AgregarCensoProductivoPageState();
}

class _AgregarCensoProductivoPageState
    extends State<AgregarCensoProductivoPage> {
  late DateTime fecha;

  @override
  void initState() {
    super.initState();
    fecha = DateTime.now();
    if (widget.censo != null) {
      fecha = widget.censo!.fechaCenso;
      floresFemeninasController.text =
          widget.censo!.palmasLeidas?.toString() ?? '';
      floresMasculinasController.text =
          widget.censo!.floresFemeninas?.toString() ?? '';
      palmasLeidasController.text =
          widget.censo!.floresMasculinas?.toString() ?? '';
      racimosVerdesController.text =
          widget.censo!.racimosVerdes?.toString() ?? '';
      racimosPintonesController.text =
          widget.censo!.racimosPintones?.toString() ?? '';
      racimosSobremadurosController.text =
          widget.censo!.racimosSobremaduros?.toString() ?? '';
      racimosMadurosController.text =
          widget.censo!.racimosMaduros?.toString() ?? '';
    }
  }

  callback(DateTime f) {
    setState(() {
      fecha = f;
    });
  }

  TextEditingController floresFemeninasController = TextEditingController();
  TextEditingController floresMasculinasController = TextEditingController();
  TextEditingController palmasLeidasController = TextEditingController();
  TextEditingController racimosVerdesController = TextEditingController();
  TextEditingController racimosPintonesController = TextEditingController();
  TextEditingController racimosSobremadurosController = TextEditingController();
  TextEditingController racimosMadurosController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBarGradient(
            title: "Agregar censo productivo",
            ruta: widget.routeName,
          ),
          // const Body(),
          SliverPadding(
            padding: const EdgeInsets.all(10),
            sliver: SliverList(
                delegate: SliverChildListDelegate([
              FechaWidget(fecha: fecha, callback: callback),
              _createField('Palmas leidas', 'Cantidad de flores femeninas',
                  floresFemeninasController),
              _createField('Flores femeninas', 'Cantidad de flores femeninas',
                  floresMasculinasController),
              _createField('Flores masculinas', 'Cantidad de flores masculinas',
                  palmasLeidasController),
              _createField('Racimos verdes', 'Cantidad de racimos verdes',
                  racimosVerdesController),
              _createField('Racimos pintones', 'Cantidad de racimos pintones',
                  racimosPintonesController),
              _createField(
                  'Racimos sobremaduros',
                  'Cantidad de racimos sobremaduros',
                  racimosSobremadurosController),
              _createField('Racimos maduros', 'Cantidad de racimos maduros',
                  racimosMadurosController),
              if (widget.censo != null) _actualizarCenso(),
              if (widget.censo == null) _agregarNuevoCenso()
            ])),
          ),
        ],
      ),
    );
    //   return Scaffold(
    //     body: SingleChildScrollView(
    //       child: Column(
    //         children: [
    //           // HeaderApp(
    //           //   ruta: widget.routeName,
    //           // ),
    //           HeaderGradient(
    //             title: "Agregar censo productivo",
    //             ruta: widget.routeName,
    //             disableBack: false,
    //           ),
    //           // crearContenido(),
    //           Padding(
    //             padding: const EdgeInsets.all(10.0),
    //             child: Column(
    //               children: [
    //                 FechaWidget(fecha: fecha, callback: callback),
    //                 _createField('Palmas leidas', 'Cantidad de flores femeninas'),
    //                 _createField(
    //                     'Flores femeninas', 'Cantidad de flores femeninas'),
    //                 _createField(
    //                     'Flores masculinas', 'Cantidad de flores masculinas'),
    //                 _createField('Racimos verdes', 'Cantidad de racimos verdes'),
    //                 _createField(
    //                     'Racimos pintones', 'Cantidad de racimos pintones'),
    //                 _createField('Racimos sobremaduros',
    //                     'Cantidad de racimos sobremaduros'),
    //                 _createField(
    //                     'Racimos maduros', 'Cantidad de racimos maduros'),
    //                 _createField(
    //                     'Flores femeninas', 'Cantidad de flores femeninas'),
    //                 _actionButtons()
    //               ],
    //             ),
    //           )
    //         ],
    //       ),
    //     ),
    //   );
    // }
  }

  _createField(String label, String hint, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        ],
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            labelText: label,
            hintText: hint,
            border: const OutlineInputBorder()),
      ),
    );
  }

  _agregarNuevoCenso() {
    return ElevatedButton(
        onPressed: () async {
          final nombreLote =
              (BlocProvider.of<LoteDetailCubit>(context).state as LoteChoosed)
                  .lote
                  .lote
                  .nombreLote;
          final res = await BlocProvider.of<CensoProductivoCubit>(context)
              .registrarCensoProductivo(
            fechaCenso: fecha,
            nombreLote: nombreLote,
            floresFemeninas: int.tryParse(floresFemeninasController.text),
            floresMasculinas: int.tryParse(floresMasculinasController.text),
            palmasLeidas: int.tryParse(palmasLeidasController.text),
            racimosVerdes: int.tryParse(racimosVerdesController.text),
            racimosPintones: int.tryParse(racimosPintonesController.text),
            racimosSobremaduros:
                int.tryParse(racimosSobremadurosController.text),
            racimosMaduros: int.tryParse(racimosMadurosController.text),
          );
          if (!mounted) return;
          if (res) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: kSuccessColor,
                content: Text('Se registro el censo correctamento'),
              ),
            );
            BlocProvider.of<CensoProductivoCubit>(context)
                .getAllCensosProductvos(nombreLote);
            Navigator.of(context).pop();
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: kRedColor,
                content: Text('Error al registrar el censo'),
              ),
            );
          }
        },
        child:
            // const Text('Actualizar datos')
            const Text('Guardar datos'));
  }

  _actualizarCenso() {
    return ElevatedButton(
        onPressed: () async {
          final nombreLote =
              (BlocProvider.of<LoteDetailCubit>(context).state as LoteChoosed)
                  .lote
                  .lote
                  .nombreLote;
          final res = await BlocProvider.of<CensoProductivoCubit>(context)
              .actualizarCensoProductivo(
            idCenso: widget.censo!.id,
            fechaCenso: fecha,
            nombreLote: nombreLote,
            floresFemeninas: int.tryParse(floresFemeninasController.text),
            floresMasculinas: int.tryParse(floresMasculinasController.text),
            palmasLeidas: int.tryParse(palmasLeidasController.text),
            racimosVerdes: int.tryParse(racimosVerdesController.text),
            racimosPintones: int.tryParse(racimosPintonesController.text),
            racimosSobremaduros:
                int.tryParse(racimosSobremadurosController.text),
            racimosMaduros: int.tryParse(racimosMadurosController.text),
          );
          if (!mounted) return;
          if (res) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: kSuccessColor,
                content: Text('Se actualizó el censo correctamento'),
              ),
            );
            BlocProvider.of<CensoProductivoCubit>(context)
                .getAllCensosProductvos(nombreLote);
            Navigator.of(context).pop();
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: kRedColor,
                content: Text('Error al actualizar el censo'),
              ),
            );
          }
        },
        child: const Text('Actualizar datos'));
  }
}

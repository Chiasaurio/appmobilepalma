import 'package:apppalma/presentation/modules/Censo_Productivo/ui/list_censos_productivos.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../components/widgets/sliver_app_bar.dart';

class CensoProductivoPage extends StatelessWidget {
  final String routeName;
  const CensoProductivoPage({super.key, required this.routeName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBarGradient(
            title: "Agregar censo productivo",
            ruta: routeName,
          ),
          // const Body(),
          const ListCensosProductivos(),
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
            '/lote/censoproductivo/nuevo',
          );
        },
        label: const Row(
          children: [
            Icon(Icons.add),
            Text(
              'Agregar censo productivo',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
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
    // FechaWidget(fecha: fecha, callback: callback),
    // _createField('Palmas leidas', 'Cantidad de flores femeninas'),
    // _createField(
    //     'Flores femeninas', 'Cantidad de flores femeninas'),
    // _createField(
    //     'Flores masculinas', 'Cantidad de flores masculinas'),
    // _createField('Racimos verdes', 'Cantidad de racimos verdes'),
    // _createField(
    //     'Racimos pintones', 'Cantidad de racimos pintones'),
    // _createField('Racimos sobremaduros',
    //     'Cantidad de racimos sobremaduros'),
    // _createField(
    //     'Racimos maduros', 'Cantidad de racimos maduros'),
    // _createField(
    //     'Flores femeninas', 'Cantidad de flores femeninas'),
    // _actionButtons()
    //               ],
    //             ),
    //           )
    //         ],
    //       ),
    //     ),
    //   );
    // }
  }

  _createField(String label, String hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: TextFormField(
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

  _actionButtons() {
    return ElevatedButton(onPressed: () {}, child: Text('Guardar datos'));
  }
}

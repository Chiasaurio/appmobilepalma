import 'package:apppalma/data/moor/moor_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

// ignore: must_be_immutable
class ListaFertilizantes extends StatefulWidget {
  final List<FertilizanteData> fertilizantes;
  final Function(FertilizanteData) callbackfertilizante;
  const ListaFertilizantes(
      {Key? key,
      required this.callbackfertilizante,
      required this.fertilizantes})
      : super(key: key);
  @override
  State<ListaFertilizantes> createState() => _ListaFertilizantesState();
}

class _ListaFertilizantesState extends State<ListaFertilizantes> {
  late double margin;
  late double anchoCard;
  late double altoCard;
  late double width;
  late double height;
  String? unidades;
  late List<FertilizanteData> fertilizantes;
  FertilizanteData? fertilizante;
  @override
  void initState() {
    fertilizantes = widget.fertilizantes;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    altoCard = height * 0.3; //150,
    anchoCard = width;
    margin = anchoCard * 0.04;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        buildProducto(),
        SizedBox(height: altoCard * 0.05),
        // buildDosis(),
      ],
    );
  }

  Widget buildProducto() {
    return Row(
      children: <Widget>[
        Expanded(
          child: _buildProducto(),
        ),
      ],
    );
  }

  Widget _buildProducto() {
    List<DropdownMenuItem<FertilizanteData>> getOpcionesDropdown() {
      List<DropdownMenuItem<FertilizanteData>> lista = [];
      for (var fertilizante in fertilizantes) {
        lista.add(DropdownMenuItem(
          value: fertilizante,
          child: Text(fertilizante.nombreFertilizante),
        ));
      }
      return lista;
    }

    return Row(children: <Widget>[
      Expanded(
        child: FormBuilderDropdown<FertilizanteData>(
          name: "producto",
          // autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: const InputDecoration(
            label: Text(
              "Productos",
              style: TextStyle(fontSize: 15),
            ),
            contentPadding: EdgeInsets.only(left: 10),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 1, color: Colors.grey), //<-- SEE HERE
            ),
          ),
          elevation: 5,
          isExpanded: true,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
          valueTransformer: (val) => val?.toString(),
          items: getOpcionesDropdown(),
          onChanged: (opt) {
            setState(() {
              fertilizante = opt;
              widget.callbackfertilizante(fertilizante!);
            });
          },
          validator: (value) =>
              value == null ? 'Este campo es requerido' : null,
        ),
      )
    ]);
  }
}

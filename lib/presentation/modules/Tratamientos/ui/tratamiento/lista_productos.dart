import 'package:apppalma/data/moor/moor_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

// ignore: must_be_immutable
class ListaProductos extends StatefulWidget {
  final List<ProductoAgroquimicoData> productos;
  final Function(ProductoAgroquimicoData) callbackproducto;
  const ListaProductos(
      {Key? key, required this.callbackproducto, required this.productos})
      : super(key: key);
  @override
  State<ListaProductos> createState() => _ListaProductosState();
}

class _ListaProductosState extends State<ListaProductos> {
  late double margin;
  late double anchoCard;
  late double altoCard;
  late double width;
  late double height;
  String? unidades;
  late List<ProductoAgroquimicoData> productos;
  ProductoAgroquimicoData? producto;
  @override
  void initState() {
    productos = widget.productos;
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
    return
        // Column(children: <Widget>[
        //   Row(
        //     children: const <Widget>[
        //       Expanded(
        //         child: Text('Seleccione el producto:',
        //             style: TextStyle(fontSize: 16.0, color: Colors.grey)),
        //       ),
        //     ],
        //   ),
        Row(
      children: <Widget>[
        Expanded(
          child: _buildProducto(),
        ),
      ],
      //   )
      // ]
    );
  }

  Widget _buildProducto() {
    List<DropdownMenuItem<ProductoAgroquimicoData>> getOpcionesDropdown() {
      List<DropdownMenuItem<ProductoAgroquimicoData>> lista = [];
      for (var producto in productos) {
        lista.add(DropdownMenuItem(
          value: producto,
          child: Text(producto.nombreProductoAgroquimico),
        ));
      }
      return lista;
    }

    return Row(children: <Widget>[
      Expanded(
        child: FormBuilderDropdown<ProductoAgroquimicoData>(
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
              producto = opt;
              widget.callbackproducto(producto!);
            });
          },
          validator: (value) =>
              value == null ? 'Este campo es requerido' : null,
        ),
      )
    ]);
    // return Row(children: <Widget>[
    //   // Icon(Icons.select_all),
    //   Expanded(
    //     child: DropdownButton<ProductoAgroquimicoData>(
    //         elevation: 5,
    //         isExpanded: true,
    //         style: const TextStyle(
    //           fontSize: 20,
    //           color: Colors.black,
    //         ),
    //         value: producto,
    //         items: getOpcionesDropdown(),
    // onChanged: (opt) {
    //   setState(() {
    //     producto = opt;
    //     widget.callbackproducto(producto!);
    //   });
    // }),
    //   )
    // ]);
  }
}

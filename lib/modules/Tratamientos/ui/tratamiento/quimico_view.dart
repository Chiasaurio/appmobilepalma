import 'package:apppalma/moor/moor_database.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductoQuimico extends StatefulWidget {
  final List<ProductoAgroquimicoData> productos;
  final Function(ProductoAgroquimicoData) callbackproducto;
  const ProductoQuimico(
      {Key? key, required this.callbackproducto, required this.productos})
      : super(key: key);
  @override
  _ProductoQuimicoState createState() => _ProductoQuimicoState();
}

class _ProductoQuimicoState extends State<ProductoQuimico> {
  var width;
  var height;
  var altoCard;
  var anchoCard;
  var margin;
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
    return Column(children: <Widget>[
      Row(
        children: const <Widget>[
          Expanded(
            child: Text('Seleccione el producto:',
                style: TextStyle(fontSize: 16.0, color: Colors.grey)),
          ),
        ],
      ),
      Row(
        children: <Widget>[
          Expanded(
            child: _buildProducto(),
          ),
        ],
      )
    ]);
  }

  Widget _buildProducto() {
    List<DropdownMenuItem<ProductoAgroquimicoData>> getOpcionesDropdown() {
      List<DropdownMenuItem<ProductoAgroquimicoData>> lista = [];
      for (var producto in productos) {
        lista.add(DropdownMenuItem(
          child: Text(producto.nombreProductoAgroquimico),
          value: producto,
        ));
      }
      return lista;
    }

    return Container(
        padding: const EdgeInsets.fromLTRB(10.0, 5.0, 0, 0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(children: <Widget>[
          // Icon(Icons.select_all),
          Expanded(
            child: DropdownButton<ProductoAgroquimicoData>(
                elevation: 5,
                isExpanded: true,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
                value: producto,
                items: getOpcionesDropdown(),
                onChanged: (opt) {
                  setState(() {
                    producto = opt;
                    widget.callbackproducto(producto!);
                  });
                }),
          )
        ]));
  }
}

import 'package:flutter/material.dart';

class TipoPlateo extends StatefulWidget {
  final Function(String) callback;
  const TipoPlateo({super.key, required this.callback});

  @override
  State<TipoPlateo> createState() => _TipoPlateoState();
}

class _TipoPlateoState extends State<TipoPlateo> {
  String? tipo;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(10.0, 5.0, 0, 0),
        margin: const EdgeInsets.all(5.0),
        child: Column(
          children: <Widget>[
            const Row(
              children: [
                Expanded(
                  child: Text('Tipo de plateo',
                      style: TextStyle(color: Colors.black, fontSize: 16)),
                ),
              ],
            ),
            _buildTipoPlateo(),
          ],
        ));
  }

  Widget _buildTipoPlateo() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Radio<String>(
              value: 'mecanico',
              groupValue: tipo,
              onChanged: (valor) {
                setState(() {
                  tipo = valor.toString();
                  widget.callback(tipo!);
                });
              },
            ),
            const Text('Mecanico'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Radio<String>(
              value: 'quimico',
              groupValue: tipo,
              onChanged: (valor) {
                setState(() {
                  tipo = valor;
                  widget.callback(tipo!);
                });
              },
            ),
            const Text('Quimico'),
          ],
        ),
      ],
    );
  }
}

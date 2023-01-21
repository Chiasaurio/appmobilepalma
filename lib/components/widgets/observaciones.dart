import 'package:flutter/material.dart';

class ObservacionWidget extends StatefulWidget {
  const ObservacionWidget({super.key});
  @override
  State<ObservacionWidget> createState() => _ObservacionWidgetState();
}

class _ObservacionWidgetState extends State<ObservacionWidget> {
  String _observacion = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildObservacion(),
    );
  }

  Widget _buildObservacion() {
    return TextFormField(
      // keyboardType: TextInputType.number,
      decoration: InputDecoration(
          hintText: 'Observaciones',
          labelText: 'Observaciones',
          helperText: 'Observaciones',
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
      onChanged: (String value) {
        _observacion = value;
      },
    );
  }
}

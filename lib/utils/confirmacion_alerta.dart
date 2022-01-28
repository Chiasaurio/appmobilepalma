import 'package:flutter/material.dart';

class ConfirmacionAlerta {
  void confirmacionAlerta(BuildContext context, Function() onPress) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  Text('¿Realmente desea finalizar la cosecha?'),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Cancelar'),
                  onPressed: () {},
                ),
                TextButton(
                  child: const Text('Ok'),
                  onPressed: onPress,
                )
              ]);
        });
  }
}

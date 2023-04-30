import 'package:flutter/material.dart';

class ConfirmacionAlerta {
  final String msg;

  ConfirmacionAlerta(this.msg);
  void confirmacionAlerta(BuildContext context, Function() onPress) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(msg),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Cancelar'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                TextButton(
                  onPressed: onPress,
                  child: const Text('Ok'),
                )
              ]);
        });
  }
}

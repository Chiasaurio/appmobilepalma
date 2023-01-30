import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void registroExitosoToast() {
  Fluttertoast.showToast(
    msg: "El registro se realizó correctamente",
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    webBgColor: "#e74c3c",
    backgroundColor: Colors.green,
    timeInSecForIosWeb: 10,
  );
}

void successMessageToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    gravity: ToastGravity.BOTTOM,
    toastLength: Toast.LENGTH_LONG,
    webBgColor: "#e74c3c",
    backgroundColor: Colors.green,
    timeInSecForIosWeb: 10,
  );
}

void registroFallidoToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    gravity: ToastGravity.BOTTOM,
    toastLength: Toast.LENGTH_LONG,
    webBgColor: "#e74c3c",
    backgroundColor: Colors.red,
    timeInSecForIosWeb: 10,
  );
}

void finalizarProcesoExitosoToast() {
  Fluttertoast.showToast(
    msg: "El proceso finalizó correctamente",
    toastLength: Toast.LENGTH_LONG,
    // webBgColor: "#e74c3c",
    backgroundColor: const Color.fromRGBO(82, 190, 30, 0.2),
    timeInSecForIosWeb: 10,
  );
}

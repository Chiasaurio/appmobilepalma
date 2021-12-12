import 'package:flutter/material.dart';

class AppBarWidget {
  static getAppBar(String nombrelote, String ruta, BuildContext context) {
    double margin = MediaQuery.of(context).size.width * 0.04;
    List<Widget> actions = [
      IconButton(
        icon: const Icon(Icons.home),
        tooltip: 'Next page',
        onPressed: () {
          Navigator.popUntil(context, ModalRoute.withName('/'));
        },
      ),
    ];

    return AppBar(
      title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(ruta, style: const TextStyle(fontSize: 12)),
            Text(nombrelote),
          ]),
      // bottom: PreferredSize(
      //   preferredSize: const Size.fromHeight(30.0),
      //   child: Container(
      //     margin: EdgeInsets.fromLTRB(margin, 0, 0 , margin),
      //     alignment: Alignment.centerLeft,
      //     child: Text(ruta, style: TextStyle(color: Colors.black, fontSize: 15), textAlign: TextAlign.center),
      //   ),
      // ),
      actions: actions,
    );
  }
}

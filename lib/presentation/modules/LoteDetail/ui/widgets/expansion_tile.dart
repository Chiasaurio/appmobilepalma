import 'package:flutter/material.dart';

import '../../../../constants.dart';

class ExpansionTileWidget extends StatelessWidget {
  final String text;
  final List<Widget> list;
  const ExpansionTileWidget({Key? key, required this.text, required this.list})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _ExpansionTileWidget(
      text: text,
      children: list,
    );
  }
}

class _ExpansionTileWidget extends StatefulWidget {
  final String text;
  final List<Widget> children;
  const _ExpansionTileWidget({
    Key? key,
    required this.text,
    required this.children,
  }) : super(key: key);

  @override
  State<_ExpansionTileWidget> createState() => _ExpansionTileWidgetState();
}

class _ExpansionTileWidgetState extends State<_ExpansionTileWidget> {
  bool isOpened = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      childrenPadding: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
      backgroundColor: kPrimaryColor,
      title: Text(
        widget.text,
        style: TextStyle(color: isOpened ? Colors.white : Colors.black),
      ),
      trailing: Icon(
        isOpened ? Icons.arrow_drop_down_circle : Icons.arrow_drop_down,
        color: isOpened ? Colors.white : Colors.grey,
      ),
      children: widget.children,
      onExpansionChanged: (bool expanded) {
        setState(() => isOpened = expanded);
      },
    );
  }
}

class Tile extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const Tile({Key? key, required this.onTap, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: double.infinity,
        height: 70,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    text,
                  ),
                  const Icon(Icons.arrow_forward)
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class DynamicTile extends StatelessWidget {
  final String nombreLote;
  final String textWithoutObject;
  final String textWithObject;
  final dynamic object;
  final String ruta;

  const DynamicTile(
      {Key? key,
      required this.nombreLote,
      required this.textWithoutObject,
      required this.ruta,
      required this.textWithObject,
      this.object})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ruta, arguments: nombreLote);
      },
      child: SizedBox(
        width: double.infinity,
        height: 70,
        child: Card(
          color: object != null ? kYellowColor : Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  object != null
                      ? Text(
                          textWithObject,
                          textAlign: TextAlign.center,
                        )
                      : Text(
                          textWithoutObject,
                          textAlign: TextAlign.center,
                        ),
                  const Icon(Icons.arrow_forward)
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

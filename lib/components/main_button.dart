import 'package:apppalma/components/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class MainButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final bool bold;
  const MainButton({
    Key? key,
    this.bold = false,
    required this.text,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 45,
        child: TextButton(
          style: TextButton.styleFrom(
              primary: Colors.white,
              minimumSize: Size(88, 36),
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              backgroundColor: AppPalmaColors.blue,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(24.0)),
              )),
          onPressed: press,
          child: Text(text,
              style: TextStyle(
                fontWeight: bold ? FontWeight.bold : FontWeight.normal,
                fontSize: 16.0,
              )),
        ));
  }
}

import 'package:apppalma/presentation/components/theme.dart';
import 'package:flutter/material.dart';

class MainButtonSquare extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final bool bold;
  const MainButtonSquare({
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
            elevation: 10,
            shadowColor: Colors.grey,
            foregroundColor: Colors.white,
            minimumSize: const Size(88, 36),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            backgroundColor: AppPalmaColors.blue,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
          ),
          onPressed: press,
          child: Text(text,
              style: TextStyle(
                fontWeight: bold ? FontWeight.bold : FontWeight.normal,
                fontSize: 16.0,
              )),
        ));
  }
}

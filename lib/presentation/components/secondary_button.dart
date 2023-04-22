import 'package:apppalma/presentation/components/theme.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final Widget? icon;
  final double height;
  final double textSize;
  final VoidCallback press;

  const SecondaryButton({
    Key? key,
    required this.text,
    required this.press,
    this.height = 45,
    this.textSize = 16,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: height,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            foregroundColor: AppPalmaColors.blue,
            side: const BorderSide(width: 2.0, color: AppPalmaColors.blue),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(24.0)),
            ),
          ),
          onPressed: press,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon ?? const SizedBox(),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Text(text,
                    style: TextStyle(
                      fontSize: textSize,
                    )),
              ),
            ],
          ),
        ));
  }
}

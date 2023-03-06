import 'package:apppalma/components/theme.dart';
import 'package:flutter/material.dart';

class SigpaButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;

  const SigpaButton({Key? key, required this.onTap, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // gradient: LinearGradient(
          //   begin: Alignment.centerRight,
          //   end: Alignment.centerLeft,
          //   colors: deliveryGradients,
          // )
          color: AppPalmaColors.blue,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            textAlign: TextAlign.center,

            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
            // textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

import 'package:apppalma/modules/Erradicaciones/ui/ErradicacionPage/components/submit_erradicacion_button.dart';
import 'package:apppalma/modules/Erradicaciones/ui/ErradicacionPage/components/validated_palma_info.dart';
import 'package:apppalma/moor/tables/palmas_table.dart';
import 'package:flutter/material.dart';

class ErradicacionConCausaWidget extends StatefulWidget {
  final PalmaValidada palma;
  const ErradicacionConCausaWidget({Key? key, required this.palma})
      : super(key: key);

  @override
  State<ErradicacionConCausaWidget> createState() =>
      _ErradicacionConCausaWidgetState();
}

class _ErradicacionConCausaWidgetState
    extends State<ErradicacionConCausaWidget> {
  late PalmaValidada palma;
  @override
  void initState() {
    palma = widget.palma;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PalmaValidadaInfo(palma: palma),
        const SizedBox(
          height: 45,
        ),
        const SubmitErradicacionButton(),
      ],
    );
  }
}

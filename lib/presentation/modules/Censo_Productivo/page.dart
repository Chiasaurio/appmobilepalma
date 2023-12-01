import 'package:apppalma/presentation/modules/Censo_Productivo/ui/list_censos_productivos.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../components/widgets/sliver_app_bar.dart';

class CensoProductivoPage extends StatelessWidget {
  final String routeName;
  const CensoProductivoPage({super.key, required this.routeName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBarGradient(
            title: "Agregar censo productivo",
            ruta: routeName,
          ),
          // const Body(),
          const ListCensosProductivos(),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/lote/censoproductivo/nuevo',
          );
        },
        label: const Row(
          children: [
            Icon(Icons.add),
            Text(
              'Agregar censo productivo',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

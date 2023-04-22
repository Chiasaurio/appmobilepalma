import 'package:apppalma/presentation/modules/Login/cubit/authentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({
    super.key,
  });
  static String selected = 'Inicio';
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      width: 250,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(
            height: 250,
            width: 70,
            child: DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  scale: 1,
                  image: AssetImage("assets/images/palma-logo.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Text(""),
            ),
          ),
          ListTile(
            leading: const Icon(
              FontAwesomeIcons.house,
              size: 18,
            ),
            title: const Text(
              'Inicio',
              style: TextStyle(fontSize: 15),
            ),
            selected: selected == 'Inicio',
            selectedTileColor: Colors.blue[100],
            onTap: () {
              selected = 'Inicio';
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(context, '/finca', (_) => false,
                  arguments: true);
            },
          ),
          ListTile(
            leading: const Icon(
              FontAwesomeIcons.map,
              size: 18,
            ),
            title: const Text('Lotes'),
            selected: selected == 'Lotes',
            selectedTileColor: Colors.blue[100],
            onTap: () {
              selected = 'Lotes';
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(context, '/lotes', (_) => false,
                  arguments: true);
            },
          ),
          ListTile(
            leading: const Icon(
              FontAwesomeIcons.cloudRain,
              size: 18,
            ),
            title: const Text('Pluviometro'),
            selectedTileColor: Colors.blue[100],
            selected: selected == 'Pluviometro',
            onTap: () {
              selected = 'Pluviometro';
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(
                  context, '/pluviometro', (_) => false,
                  arguments: true);
            },
          ),
          ListTile(
            leading: const Icon(
              FontAwesomeIcons.truck,
              size: 18,
            ),
            selectedTileColor: Colors.blue[100],
            title: const Text('Viajes'),
            selected: selected == 'Viajes',
            onTap: () {
              selected = 'Viajes';
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(
                  context, '/viajes', (_) => false,
                  arguments: true);
            },
          ),
          ListTile(
            leading: const Icon(
              FontAwesomeIcons.rotate,
              size: 18,
            ),
            title: const Text('Sincronizar'),
            selectedTileColor: Colors.blue[100],
            selected: selected == 'Sincronizar',
            onTap: () {
              selected = 'Sincronizar';
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(
                  context, '/sincronizar', (_) => false,
                  arguments: true);
            },
          ),
          ListTile(
              leading: const Icon(
                FontAwesomeIcons.cloudArrowUp,
                size: 18,
              ),
              title: const Text('Subir a la nube'),
              selectedTileColor: Colors.blue[100],
              selected: selected == 'Subir a la nube',
              onTap: () {
                selected = 'Subir a la nube';
                Navigator.pop(context);
                Navigator.pushNamedAndRemoveUntil(
                    context, '/sinctoserver', (_) => false,
                    arguments: true);
              }),
          ListTile(
            leading: const Icon(
              FontAwesomeIcons.powerOff,
              size: 18,
            ),
            title: const Text('Logout'),
            selectedTileColor: Colors.blue[100],
            onTap: () {
              // AuthenticationBloc authenticationBloc = AuthenticationBloc();
              // authenticationBloc.add(AuthenticationLogoutRequested());
              AuthenticationCubit auth = AuthenticationCubit();
              auth.logout();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

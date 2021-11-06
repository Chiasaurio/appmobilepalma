import 'package:apppalma/Home/home_screen.dart';
import 'package:apppalma/LotesList/presentation/lotes_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      // case '/splash':
      //   return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/finca':
        return MaterialPageRoute(builder: (_) => FincaPage());
      case '/lotes':
        return MaterialPageRoute(builder: (_) => EscogerLotePage());
      default:
        return _errorScreen();
    }
  }

  static Route<dynamic> _errorScreen() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
          appBar: AppBar(
            title: Text("Error 404"),
          ),
          body: Center(
            child: Text('Error'),
          ));
    });
  }
}

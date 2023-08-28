import 'package:apppalma/presentation/modules/Censo/ui/widgets/persistent_sliver_header.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants.dart';

class SliverAppBarGradient extends StatelessWidget {
  SliverAppBarGradient({
    Key? key,
    required this.title,
    required this.ruta,
    this.disableBack = false,
    this.showDrawer = false,
    this.onPop,
  }) : super(key: key);
  final bool disableBack;
  final bool showDrawer;
  final String title;
  final String ruta;
  final VoidCallback? onPop;
  final Color colorBlanco = Colors.white.withOpacity(0.7);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: MySliverPersistentHeaderDelegate(
        Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(0)),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [kpurpleColor, kblueColor])),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: MediaQuery.of(context).padding.top),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 75.0),
                  child: Text(ruta,
                      style: TextStyle(
                          fontSize: 15,
                          color: colorBlanco,
                          fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (disableBack) {
                                  Navigator.pushNamedAndRemoveUntil(
                                      context, '/finca', (_) => false,
                                      arguments: true);
                                } else {
                                  Navigator.of(context).pop();
                                }
                                if (onPop != null) {
                                  onPop!();
                                }
                              },
                              child: FaIcon(FontAwesomeIcons.arrowLeft,
                                  size: 25,
                                  color: Colors.white.withOpacity(0.7)),
                            ),
                            const SizedBox(width: 30),
                            Flexible(
                              child: Text(title,
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: colorBlanco,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                      if (showDrawer)
                        Builder(
                          builder: (BuildContext context) {
                            return GestureDetector(
                              child: const Icon(
                                Icons.menu,
                                color: Colors.white,
                              ),
                              onTap: () {
                                Scaffold.of(context).openDrawer();
                              },
                              // tooltip: MaterialLocalizations.of(context)
                              //     .openAppDrawerTooltip,
                            );
                          },
                        ),
                    ],
                  ),
                )
              ]),
        ),
      ),
    );
    // return SliverAppBar(
    //     pinned: true,
    //     title: Text(ruta,
    //         style: TextStyle(
    //             fontSize: 15, color: colorBlanco, fontWeight: FontWeight.bold)),
    //     expandedHeight: 70 + SizeConfig.paddingTop,
    //     flexibleSpace: FlexibleSpaceBar(
    //       stretchModes: const [StretchMode.fadeTitle],
    //       background: Container(
    //         decoration: const BoxDecoration(
    //             borderRadius: BorderRadius.only(bottomLeft: Radius.circular(0)),
    //             gradient: LinearGradient(
    //                 begin: Alignment.topCenter,
    //                 end: Alignment.bottomCenter,
    //                 colors: [kpurpleColor, kblueColor])),
    //       ),
    //       title: Text(title,
    //           style: TextStyle(
    //               fontSize: 15,
    //               color: colorBlanco,
    //               fontWeight: FontWeight.bold)),
    //     ));
  }
}

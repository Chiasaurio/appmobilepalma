import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double defaultSize;
  static late double screenBodyHeight;
  static late double paddingTop;
  static late Orientation orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    var padding = MediaQuery.of(context).padding;
    paddingTop = padding.top;
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height - padding.top - kToolbarHeight;
    screenBodyHeight = _mediaQueryData.size.height - padding.top;
    orientation = _mediaQueryData.orientation;
  }
}
// // Height (without SafeArea)
// double height1 = height - padding.top - padding.bottom;

// // Height (without status bar)
// double height2 = height - padding.top;

// // Height (without status and toolbar)
// double height3 = height - padding.top - kToolbarHeight;

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // 812 is the layout height that designer use
  return (inputHeight / 812.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // 375 is the layout width that designer use
  return (inputWidth / 375.0) * screenWidth;
}

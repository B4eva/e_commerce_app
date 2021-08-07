import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
  }

  //Get the propotionate height as per screen size
  double getProportionateScreenHeight(double inputHeight) {
    double? screenHeight = SizeConfig.screenHeight;

    //812 is the layout that designer user
    return (inputHeight / 812) * screenHeight!;
  }

  //Get the propotionate Width as per screen size
  double getProportionateScreenWidth(double inputWidth) {
    double? screenWidth = SizeConfig.screenWidth;

    //375 is the layout Width that designer user
    return (inputWidth / 2) * screenWidth!;
  }
}

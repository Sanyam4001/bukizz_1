import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

class Dimensions {
  final BuildContext context;

  Dimensions(this.context);

  double get screenHeight => MediaQuery.of(context).size.height;

  double get screenWidth => MediaQuery.of(context).size.width;

  double get width16 => screenWidth / 23.43;

  double get width24 => screenWidth / 15.625;

  double get width80 => screenWidth / 4.69;

  double get width120 => screenWidth / 3.125;

  double get width169 => screenWidth / 2.22;

  double get width327 => screenWidth / 1.147;

  double get width342 => screenWidth / 1.097;



  double get height8 => screenHeight / 101.5;

  double get height10 => screenHeight / 81.2;

  double get height16 => screenHeight / 50.75;

  double get height24 => screenHeight / 33.84;

  double get height32 => screenHeight / 25.375;


  double get height36 => screenHeight / 22.56;

  double get height40 => screenHeight / 20.3;


  double get height48 => screenHeight / 16.92;





  double get height86 => screenHeight / 9.45;

  double get height138 => screenHeight / 5.89;

  double get height172 => screenHeight / 4.720;

  double get height240 => screenHeight / 3.39;


  //this section for slider only
  double get pageViewContainer=>screenHeight/3.84;
  double get pageView=>screenHeight/2.64;

  double get width10=>screenHeight/84.4;
  double get width9=>screenHeight/84.4;
  double get radius30=>screenHeight/28.13;
}

//812
//375




import 'package:flutter/material.dart';

class SizeConfig {
  static late double width;
  static late double height;

  static init(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }
}

//How to use it?
// step 1: define in Context
//         SizeConfig.init(context);

// step 2: width: SizeConfig.width * 0.5


import 'package:flutter/material.dart';

class Responsive {
  late BuildContext context;
  late double _width, _height;

  Responsive(BuildContext context) {
    //prueba subida
    this.context = context;
    this._width = MediaQuery.of(context).size.width / 100;
    this._height = MediaQuery.of(context).size.height / 100;
  }

  double width(double percentage) {
    return this._width * percentage;
  }

  double height(double percentage) {
    return this._height * percentage;
  }

  double percentageWidth(double width) {
    return (width * 100) / MediaQuery.of(this.context).size.width;
  }

  double percentageHeight(double height) {
    return (height * 100) / MediaQuery.of(this.context).size.height;
  }
}

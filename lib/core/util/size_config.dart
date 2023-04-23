import 'package:flutter/widgets.dart';
import 'dart:html';

class SizeConfig {
  static late double height;
  static late double width;

  void init() {
    height = window.screen!.height!.toDouble();
    width = window.screen!.width!.toDouble();
  }
}

import 'package:flutter/material.dart';
import 'dart:math' as math;

class Responsive {
  late double _width, _height, _diagonal;
  late bool _isTablet;
  double get width => _width;
  bool get isTablet => _isTablet;
  double get height => _height;
  double get diagonal => _diagonal;
  static Responsive of(BuildContext context) => Responsive(context);

  Responsive(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    _width = size.width;
    _height = size.height;
    _diagonal = math.sqrt(math.pow(_width, 2) + math.pow(_height, 2));
    _isTablet = size.shortestSide >= 600;
  }
  double wp(double perecent) => _width * perecent / 100;
  double hp(double perecent) => _height * perecent / 100;
  double dp(double perecent) => _diagonal * perecent / 100;
}

import 'package:flutter/material.dart';

class Rectangle extends StatelessWidget {
  final double width;
  final double heigth;
  final List<Color> colors;
  const Rectangle(
      {Key? key,
      required this.width,
      required this.heigth,
      required this.colors})
      : assert(width > 0),
        assert(colors.length >= 2),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: heigth,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(width * 0.12),
            bottomRight: Radius.circular(width * 0.12),
          ),
          gradient: LinearGradient(
              colors: colors,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight)),
    );
  }
}

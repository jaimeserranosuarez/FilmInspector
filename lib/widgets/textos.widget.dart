import 'package:flutter/material.dart';

Widget textos(BuildContext context, String texto, Color color,
    FontWeight fontweight, double size) {
  return Text(
    texto,
    overflow: TextOverflow.ellipsis,
    maxLines: 2,
    style: TextStyle(
        fontFamily: "Poppins",
        color: color,
        fontWeight: fontweight,
        fontSize: size),
  );
}

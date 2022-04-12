/// CUSTOM TEXT WIDGET FOR SHAYO MED
/// ACCEPTS THE WIDGET CONTENT, FONT SIZE AND THE COLOUR.
/// RETURNS THE TEXT WIDGET WITH THE PARAMETERS APPLIED.
import 'package:flutter/material.dart';

class ShayoMedTextWidget extends StatelessWidget {
  final String theContent;
  final double fontSize;
  final Color fontColour;
  const ShayoMedTextWidget(
      {Key? key,
      required this.theContent,
      required this.fontSize,
      required this.fontColour})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      theContent,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
          fontFamily: "Poppins",
          color: fontColour,
          overflow: TextOverflow.visible),
    );
  }
}

import 'package:flutter/material.dart';

class TextLabel {

  static Text textBold({
    required String text,
    double? size = 30.0}) {
    return Text(text,
    textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: Colors.white.withOpacity(0.8),
      ),
    );
  }

  static Text textNormal({
    required String text,
    double? size = 18.0}) {
    return Text(text,
    textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: size,
        color: Colors.white.withOpacity(0.4),
      ),
    );
  }
}
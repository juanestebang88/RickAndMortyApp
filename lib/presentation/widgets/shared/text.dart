import 'package:flutter/material.dart';
import 'package:rick_morty/config/constants/constants.dart';

class TextLabel {

  static Text textBold({
    required String text,
    double? size = 30.0,
    bool isBlue = false}) {
    return Text(text,
    textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w500,
        color: isBlue
        ? Constants.blueOpacityRM
        : Constants.whiteOpacityRM,
      ),
    );
  }

  static Text text({
    required String text,
    double? size = 18.0,
    bool isBlue = false}) {
    return Text(text,
    textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: size,
        color: isBlue
        ? Constants.blueOpacityRM
        : Constants.whiteOpacityRM,
      ),
    );
  }

  static Text textBoldRM({
    required String text,
    double? size = 30.0,
    bool isBlue = false}) {
    return Text(text,
    textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: isBlue
        ? Constants.blueOpacityRM
        : Constants.whiteOpacityRM,
        fontFamily: 'rickmorty',
      ),
    );
  }

  static Text textRM({
    required String text,
    double? size = 18.0,
    bool isBlue = false}) {
    return Text(text,
    textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: size,
        color: isBlue
        ? Constants.blueOpacityRM
        : Constants.whiteOpacityRM,
        fontFamily: 'rickmorty',
      ),
    );
  }
}
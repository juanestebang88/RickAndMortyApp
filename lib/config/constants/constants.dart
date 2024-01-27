import 'package:flutter/material.dart';

class Constants {
  // API

  static const baseURL = 'https://rickandmortyapi.com/api/';
  static const characterEndpoint = 'character/';
  static const locationEndpoint = 'location/';
  static const episodeEndpoint = 'episode/';

  // IMAGES

  static const loaderRick = 'assets/images/loading-rick.gif';
  static const loaderMorty = 'assets/images/loading-morty.gif';
  static const logo = 'assets/images/logo.png';
  static const backgroundImage = 'assets/images/background-image.jpeg';
  static const portal = 'assets/images/portal.gif';

  //COLORS
  static Color blueOpacityRM = const Color(0xFF31B3C7).withOpacity(0.8);
  static Color whiteOpacityRM = const Color.fromARGB(255, 255, 255, 255).withOpacity(0.8);
}
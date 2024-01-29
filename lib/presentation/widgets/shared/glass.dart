import 'dart:ui';
import 'package:flutter/material.dart';

class GlassFormism {

static BackdropFilter background(){
  return BackdropFilter(
    filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
    child: const SizedBox.shrink()
  );
}

  static Container container({required Widget child}){
    return Container(
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        boxShadow: [ BoxShadow(color: Colors.black.withOpacity(0.25)) ],
        border: Border.all(color: Colors.white.withOpacity(0.2), width: 0.5),
        gradient: LinearGradient(
          stops: const [0.0, 1.0],
          colors: [
            Colors.white.withOpacity(0.4),
            Colors.white.withOpacity(0.1)
          ],
        ),
        borderRadius: BorderRadius.circular(20)
      ),
      child: child
    );
  }
}

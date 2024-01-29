import 'package:flutter/material.dart';
import 'package:rick_morty/config/constants/constants.dart';
import 'package:rick_morty/presentation/widgets/widgets.dart';

class BackgroundApp extends StatelessWidget {
  const BackgroundApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(Constants.backgroundImage,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
        GlassFormism.background(),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:rick_morty/config/constants/constants.dart';

class ImageCharacter extends StatelessWidget {
  const ImageCharacter({
    super.key,
    required this.image,
    required this.size,
  });

  final String image;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(size.width*0.05),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: FadeInImage(
          placeholderFit: BoxFit.contain,
          fit: BoxFit.cover,
          height: size.width*0.6,
          image: NetworkImage(image),
          placeholder: const AssetImage(Constants.portal),
        ),
      ),
    );
  }
}
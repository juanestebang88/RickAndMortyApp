import 'package:flutter/material.dart';
import 'package:rick_morty/config/constants/constants.dart';
import 'package:rick_morty/domain/entities/character.dart';
import 'package:rick_morty/presentation/widgets/shared/glass.dart';
import 'package:rick_morty/presentation/widgets/widgets.dart';

class CharacterCard extends StatelessWidget {
  final CharacterEntity character;

  const CharacterCard({
    super.key,
    required this.character
  });

  @override
  Widget build(BuildContext context) {
    return GlassFormism.container(
      child: SizedBox(
        height: 100.0,
        child: Row(
          children: [
            Expanded(child: _ImageViewer(image: character.image)),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextLabel.textBold(text: character.name, size: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextLabel.textBold(text: character.species, size: 18),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class _ImageViewer extends StatelessWidget {
  final String image;
  const _ImageViewer({required this.image});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        bottomLeft: Radius.circular(20),
      ),
      child: SizedBox(
        child: FadeInImage(
          placeholderFit: BoxFit.contain,
          fit: BoxFit.cover,
          height: 100.0,
          image: NetworkImage(image),
          placeholder: const AssetImage(Constants.portal),
        ),
      ),
    );
  }
}






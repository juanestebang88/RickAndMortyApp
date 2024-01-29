import 'package:flutter/material.dart';
import 'package:rick_morty/presentation/widgets/widgets.dart';

class NameCharacter extends StatelessWidget {
  const NameCharacter({
    super.key,
    required this.mediaQ,
    required this.name,
  });

  final Size mediaQ;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: mediaQ.height*0.02),
      child: Center(
        child: TextLabel.textBoldRM(
          text: name,
          size: mediaQ.width*0.08,
          isBlue: true
        )
      ),
    );
  }
}
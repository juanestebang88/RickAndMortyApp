import 'package:flutter/material.dart';
import 'package:rick_morty/presentation/widgets/widgets.dart';

class DescriptionProperty extends StatelessWidget {
  const DescriptionProperty(
    this.property, this.value, {super.key}
  );

  final String property;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextLabel.text(text: '$property:  ', size: 18),
        TextLabel.textBold(text: value, size: 18),
      ],
    );
  }
}
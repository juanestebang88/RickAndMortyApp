import 'package:flutter/material.dart';
import 'package:rick_morty/domain/entities/character.dart';
import 'package:rick_morty/presentation/widgets/widgets.dart';

class CustomGridView extends StatefulWidget {

  final List<CharacterEntity> characters;
  final VoidCallback? loadNextPage;

  const CustomGridView({
    required this.characters,
    this.loadNextPage,
    super.key,
  });

  @override
  State<CustomGridView> createState() => _CustomGridViewState();
}

class _CustomGridViewState extends State<CustomGridView> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      final position = scrollController.position;
      if (widget.loadNextPage == null) return;
      if ((position.pixels + 400)>=position.maxScrollExtent) {
        widget.loadNextPage!();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
          itemCount: widget.characters.length,
          itemBuilder: (context, index){
            return CharacterCard(character: widget.characters[index]);
          }
        ),
      )
    );
  }
}
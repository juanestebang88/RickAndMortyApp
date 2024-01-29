import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_morty/domain/entities/character.dart';
import 'package:rick_morty/presentation/widgets/widgets.dart';

class CustomListView extends StatefulWidget {

  final String titleList;
  final List<CharacterEntity> characters;
  final VoidCallback? loadNextPage;

  const CustomListView({
    required this.titleList,
    required this.characters,
    this.loadNextPage,
    super.key,
  });

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
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
    return CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverAppBar(
            floating: true,
            backgroundColor: Colors.transparent,
            flexibleSpace: Center(
              child: FlexibleSpaceBar(
                centerTitle: true,
                background: Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: TextLabel.textBoldRM(text: widget.titleList, size: 34, isBlue: true),
                )
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final character = widget.characters[index];
                return GestureDetector(
                  onTap: ()=> context.push('/detail-character/${character.id.toString()}'),
                  child: CharacterCard(character: character)
                );
              },
              childCount: widget.characters.length,
            ),
          ),
        ],
      );
  }
}
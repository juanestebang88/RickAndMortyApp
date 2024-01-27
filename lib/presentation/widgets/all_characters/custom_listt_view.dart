import 'package:flutter/material.dart';
import 'package:rick_morty/domain/entities/character.dart';
import 'package:rick_morty/presentation/widgets/widgets.dart';

class CustomListView extends StatefulWidget {

  final List<CharacterEntity> characters;
  final VoidCallback? loadNextPage;

  const CustomListView({
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
                  child: TextLabel.textBold(text: 'Rick And Morty', size: 34, isBlue: true),
                )
                // Image.asset(Constants.logo,
                //     width: MediaQuery.of(context).size.width*0.5,
                //     height: 50,
                //   ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final character = widget.characters[index];
                return CharacterCard(character: character);
              },
              childCount: widget.characters.length,
            ),
          ),
        ],
      );
  }
}
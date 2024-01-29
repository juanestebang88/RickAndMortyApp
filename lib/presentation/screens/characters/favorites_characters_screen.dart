import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_morty/presentation/providers/providers.dart';

import 'package:rick_morty/presentation/widgets/widgets.dart';

class FavoritesCharactersScreen extends StatelessWidget {
  static const name = 'favorites-screen';

  const FavoritesCharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      floatingActionButton: CustomFloatingButton(),
      body: FavoritesCharactersView(),
    );
  }
}

class FavoritesCharactersView extends ConsumerStatefulWidget {
  const FavoritesCharactersView({super.key});

  @override
    FavoritesCharactersViewState createState() => FavoritesCharactersViewState();
}

class FavoritesCharactersViewState extends ConsumerState<FavoritesCharactersView> {
  @override
  void initState() {
    // ref.read(favoritesCharacterProvider.notifier).loadNextPage();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final favoritesCharacters = ref.watch(favoritesCharacterProvider).values.toList();

    return Stack(
      children:[
        const BackgroundApp(),

        CustomListView(
          titleList: 'Favorites',
          characters: favoritesCharacters,
          loadNextPage: ()=> ref.read(favoritesCharacterProvider.notifier).loadNextPage(),
        ),
      ] 
    );
  }
}



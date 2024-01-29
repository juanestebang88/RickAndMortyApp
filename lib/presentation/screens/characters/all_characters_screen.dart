import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rick_morty/presentation/providers/characters/characters_provider.dart';
import 'package:rick_morty/presentation/widgets/widgets.dart';

class AllCharactersScreen extends StatelessWidget {
  static const name = 'home-screen';

  const AllCharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      floatingActionButton: CustomFloatingButton(),
      body: AllCharactersView(),
    );
  }
}

class AllCharactersView extends ConsumerStatefulWidget {
  const AllCharactersView({super.key});

  @override
  AllCharactersViewState createState() => AllCharactersViewState();
}

class AllCharactersViewState extends ConsumerState<AllCharactersView> {
  @override
  void initState() {
    ref.read(allCharactersProvider.notifier).loadNextPage();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final allCharacters = ref.watch(allCharactersProvider);

    return Stack(
      children:[
        const BackgroundApp(),
        CustomListView(
          titleList: 'Rick App Morty',
          characters: allCharacters,
          loadNextPage: ()=> ref.read(allCharactersProvider.notifier).loadNextPage(),
        ),
      ] 
    );
  }
}



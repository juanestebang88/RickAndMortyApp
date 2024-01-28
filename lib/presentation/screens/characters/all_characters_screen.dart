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
      body: _AllCharactersScreen(),
    );
  }
}

class _AllCharactersScreen extends ConsumerStatefulWidget {
  const _AllCharactersScreen();

  @override
  _AllCharactersViewState createState() => _AllCharactersViewState();
}

class _AllCharactersViewState extends ConsumerState<_AllCharactersScreen> {
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
          characters: allCharacters,
          loadNextPage: ()=> ref.read(allCharactersProvider.notifier).loadNextPage(),
        ),
      ] 
    );
  }
}


